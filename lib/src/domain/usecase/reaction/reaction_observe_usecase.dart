import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/composer_usecase/reaction_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

class ReactionObserveUseCase
    extends UseCase<List<AmityReaction>, GetReactionRequest> {
  final ReactionRepo reactionRepo;
  final PagingIdRepo pagingIdRepo;
  final ReactionComposerUsecase reactionComposerUsecase;

  ReactionObserveUseCase(
      {required this.reactionRepo,
      required this.pagingIdRepo,
      required this.reactionComposerUsecase});

  @override
  Future<List<AmityReaction>> get(params) {
    throw UnimplementedError();
  }

  StreamController<List<AmityReaction>> listen(
      RequestBuilder<GetReactionRequest> request) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    final streamController = StreamController<List<AmityReaction>>();
    reactionRepo.listenReactions(request).listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });
    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetReactionRequest> request,
  ) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    if (streamController.isClosed) {
      return;
    }
    final reactionEntities = reactionRepo.getReactionEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (reactionEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityReaction>[]);
    } else {
      final reactionIds = pagingIds.map((e) => e.id).toList();

      final reactions = reactionEntities
          .where((reaction) => reactionIds.contains(reaction.reactionId))
          .map((e) => e.convertToAmityReaction())
          .toList()
        ..sort((a, b) => (b.createdAt ?? DateTime.now())
            .compareTo(a.createdAt ?? DateTime.now()));
      Stream.fromIterable(reactions).forEach((element) async {
        element = await reactionComposerUsecase.get(element);
      });
      if (!streamController.isClosed) {
        streamController.add(reactions);
      }
    }
  }
}
