// ignore_for_file: hash_and_equals

import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data_source/local/interface/role_object.dart';
import 'package:hive/hive.dart';

part 'community_role_hive_entity_26.g.dart';

@HiveType(typeId: AmityHiveType.communityRole)
class CommunityRoleHiveEntity extends HiveObject implements RoleObject {
  @HiveField(0)
  String? communityId;

  @HiveField(1)
  String? userId;

  @HiveField(2)
  String? roleName;

  CommunityRoleHiveEntity({
    this.communityId,
    this.userId,
    this.roleName,
  });

  @override
  int get hashCode => Object.hash(communityId, userId, roleName);

  @override
  CommunityRoleHiveEntity create(
      String targetId, String userId, String roleName) {
    final communityRoleHiveEntity = CommunityRoleHiveEntity();
    communityRoleHiveEntity.communityId = targetId;
    communityRoleHiveEntity.userId = userId;
    communityRoleHiveEntity.roleName = roleName;
    return communityRoleHiveEntity;
  }
}
