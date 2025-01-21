// ignore_for_file: hash_and_equals

import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data_source/local/interface/permission_object.dart';
import 'package:hive/hive.dart';

part 'community_permission_hive_entity_25.g.dart';

@HiveType(typeId: AmityHiveType.communityPermission)
class CommunityPermissionHiveEntity extends HiveObject
    implements PermissionObject {

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? communityId;

  @HiveField(2)
  String? userId;

  @HiveField(3)
  String? permissionName;

  @override
  int get hashCode => Object.hash(communityId, userId, permissionName);

  CommunityPermissionHiveEntity({
    this.id,
    this.communityId,
    this.userId,
    this.permissionName,
  });

  @override
  CommunityPermissionHiveEntity create(
      String targetId, String userId, String permissionName) {
    final commnityPermissionHiveEntity = CommunityPermissionHiveEntity();
    commnityPermissionHiveEntity.id = targetId + userId;
    commnityPermissionHiveEntity.communityId = targetId;
    commnityPermissionHiveEntity.userId = userId;
    commnityPermissionHiveEntity.permissionName = permissionName;
    return commnityPermissionHiveEntity;
  }
}
