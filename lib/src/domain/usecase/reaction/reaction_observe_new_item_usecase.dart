import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

class ReactionObserveNewItemUseCase
    extends ObserverUseCase<PagingIdHiveEntity, GetReactionRequest> {
  final ReactionRepo reactionRepo;
  final PagingIdRepo pagingIdRepo;
  HashMap<String, bool> reactionIdMap = HashMap();

  ReactionObserveNewItemUseCase(
      {required this.reactionRepo, required this.pagingIdRepo});

  @override
  StreamController<PagingIdHiveEntity> listen(
      RequestBuilder<GetReactionRequest> params) {
    final streamController = StreamController<PagingIdHiveEntity>();
    reactionRepo.listenReactions(params).listen((event) async {
      _onChanges(streamController, params);
    });
    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetReactionRequest> request,
  ) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    var firstPosition = 0;
    if (streamController.isClosed) {
      return;
    }
    final reactionEntities = reactionRepo.getReactionEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (pagingIds.isNotEmpty) {
      firstPosition = pagingIds.map((e) => e.position ?? 0).reduce(min);
    }
    if (reactionEntities.isNotEmpty && pagingIds.isNotEmpty) {
      final reactionIds = pagingIds.map((e) => e.id).toList();
      reactionEntities.sort((a, b) => (a.createdAt ?? DateTime.now())
          .compareTo((b.createdAt ?? DateTime.now())));
      final reactionId = reactionEntities
          .where((reaction) => !reactionIds.contains(reaction.reactionId))
          .firstOrNull
          ?.reactionId;
      if (reactionId != null && reactionIdMap[reactionId] != true) {
        final pagingId = PagingIdHiveEntity(
          id: reactionId,
          hash: hash,
          nonce: nonce,
          position: firstPosition - 1,
        );
        if (!streamController.isClosed) {
          reactionIdMap[reactionId] = true;
          streamController.add(pagingId);
        }
      }
    }
  }
}
