import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/pin_repo.dart';

class PinnedPostComposerUsecase
    extends UseCase<AmityPinnedPost, AmityPinnedPost> {
  final PinRepo pinRepo;
  final PostRepo postRepo;
  final UserRepo userRepo;
  final PostComposerUsecase postComposerUsecase;
  final UserComposerUsecase userComposerUsecase;

  PinnedPostComposerUsecase({
    required this.pinRepo,
    required this.postRepo,
    required this.userRepo,
    required this.postComposerUsecase,
    required this.userComposerUsecase,
  });

  @override
  Future<AmityPinnedPost> get(AmityPinnedPost params) async {
    // compose post
    try {
      params.post = await postRepo.getPostByIdFromDb(params.postId);
      if (params.post != null) {
        params.post = await postComposerUsecase.get(params.post!);
      }
    } catch (e) {}

    // compose user
    try {
      final pinnedBy = await userRepo.getUserByIdFromDb(params.pinnedById);
      if (pinnedBy != null) {
        params.pinnedBy = await userComposerUsecase.get(pinnedBy);
      }
    } catch (e) {}

    return params;
  }
}
