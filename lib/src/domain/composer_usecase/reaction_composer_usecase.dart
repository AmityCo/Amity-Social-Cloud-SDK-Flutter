import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class ReactionComposerUsecase extends UseCase<AmityReaction, AmityReaction> {
  final ReactionRepo reactionRepo;
  final UserRepo userRepo;
  final UserComposerUsecase userComposerUsecase;

  ReactionComposerUsecase({
    required this.reactionRepo,
    required this.userComposerUsecase,
    required this.userRepo,
  });

  @override
  Future<AmityReaction> get(AmityReaction params) async {

    //Compose the user info
    final user = await userRepo.getUserByIdFromDb(params.userId!);

    final composedUser = await userComposerUsecase.get(user);
    params.creator = composedUser;

    params.userDisplayName = user.displayName ?? "";

    return params;
  }
}
