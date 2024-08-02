import 'package:amity_sdk/src/core/enum/amity_membership_sorting_order.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

abstract class CommunityMemberDbAdapter {
  Future saveCommunityMemberEntity(CommnityMemberHiveEntity entity, UserHiveEntity? userEntity);
  CommnityMemberHiveEntity? getCommunityMemberEntity(String id);
  Future deleteCommunityMemberEntity(CommnityMemberHiveEntity entity);
  CommnityMemberHiveEntity getCommunityMemberEntities(
      String communityId,
      List<String> roles,
      List<String> memberships,
      AmityMembershipSortOption sortOption);
  Stream<CommnityMemberHiveEntity> listenCommnunityMemberEntity(String id);
}
