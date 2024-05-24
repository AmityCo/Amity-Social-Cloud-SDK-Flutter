import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/community_member_repo.dart';

/// [CommunityMemberPermissionCheckUsecase]
class CommunityMemberPermissionCheckUsecase
    extends SynchronousUseCase<bool, CommunityMemberPermissionCheckRequest> {
  /// Community Member Repo
  final CommunityMemberRepo communityMemberRepo;
  final UserRepo userRepo;

  /// Init [CommunityMemberPermissionCheckUsecase]
  CommunityMemberPermissionCheckUsecase(
      {required this.communityMemberRepo, required this.userRepo});

  @override
  bool get(CommunityMemberPermissionCheckRequest params) {
    var hasPermission = false;
    var hasGlobalPermissions = false;
    try {
      final permissions = communityMemberRepo.getMemberPermission(
          params.communityId, params.userId);
      final userPermissions = userRepo.getPermissions(params.userId);
      hasGlobalPermissions =
          userPermissions.contains(params.permission!.value);
      hasPermission = permissions?.contains(params.permission!.value) ?? false;
      return hasPermission || hasGlobalPermissions;
    } catch (exception) {
      hasPermission = false;
    }
    return hasPermission;
  }
}
