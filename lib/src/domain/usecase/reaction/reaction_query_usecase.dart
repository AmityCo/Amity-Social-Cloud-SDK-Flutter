import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/composer_usecase/reaction_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// GetReactionUsecase
class ReactionQueryUsecase extends UseCase<
    PageListData<List<AmityReaction>, String>, GetReactionRequest> {
  /// Reaction Repo
  final ReactionRepo reactionRepo;
  final ReactionComposerUsecase reactionComposerUsecase;

  /// User Repo
  final UserRepo userRepo;

  /// init [ReactionQueryUsecase]
  ReactionQueryUsecase({
    required this.reactionRepo,
    required this.userRepo,
    required this.reactionComposerUsecase
  });

  @override
  Future<PageListData<List<AmityReaction>, String>> get(
      GetReactionRequest params) async {
    final amityReaction = await reactionRepo.getReaction(params);
    final amityComposedReaction = await Stream.fromIterable(amityReaction.data)
        .asyncMap((event) => reactionComposerUsecase.get(event))
        .toList();

    return amityReaction.withItem1(amityComposedReaction);
  }
}
