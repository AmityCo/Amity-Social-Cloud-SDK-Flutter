import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class ReactionComposerUsecase extends UseCase<AmityReaction, AmityReaction> {
  final ReactionRepo reactionRepo;
  final UserRepo userRepo;

  ReactionComposerUsecase({
    required this.reactionRepo,
    required this.userRepo,
  });

  @override
  Future<AmityReaction> get(AmityReaction params) async {

    //Compose the user info
    final user = await userRepo.getUserByIdFromDb(params.userId!);
    params.userDisplayName = user.displayName ?? "";

    return params;
  }
}
