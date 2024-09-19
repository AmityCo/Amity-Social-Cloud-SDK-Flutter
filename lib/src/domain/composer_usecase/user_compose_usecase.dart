import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// User Composer Usecae - to construct full user object
class UserComposerUsecase extends UseCase<AmityUser, AmityUser> {
  /// File Repo
  final FileRepo fileRepo;

  /// Init [UserComposerUsecase]
  UserComposerUsecase({required this.fileRepo});

  @override
  Future<AmityUser> get(AmityUser params) async {
    final avatarFileId = params.avatarFileId;
    if (avatarFileId != null) {
      final fileProperties =
          await fileRepo.getFileByIdFromDb(avatarFileId);
      params.avatarUrl = fileProperties.fileUrl;
    }
    return params;
  }
}
