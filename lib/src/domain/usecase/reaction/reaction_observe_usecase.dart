import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/composer_usecase/reaction_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class ReactionObserveUseCase extends UseCase<List<AmityReaction>, GetReactionRequest> {
  final ReactionRepo reactionRepo;
  final ReactionComposerUsecase reactionComposerUsecase;

  ReactionObserveUseCase({
    required this.reactionRepo,
    required this.reactionComposerUsecase
  });

  @override
  Future<List<AmityReaction>> get(params) {
    throw UnimplementedError();
  }

  StreamController<List<AmityReaction>> listen(
      RequestBuilder<GetReactionRequest> request) {
    final streamController = StreamController<List<AmityReaction>>();
    reactionRepo.listenReactions(request).listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await reactionComposerUsecase.get(element);
      });
      streamController.add(event);
    });
    return streamController;
  }
}
