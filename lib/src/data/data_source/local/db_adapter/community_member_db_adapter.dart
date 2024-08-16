import 'package:amity_sdk/src/core/enum/amity_membership_sorting_order.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

abstract class CommunityMemberDbAdapter {
  Future saveCommunityMemberEntity(CommunityMemberHiveEntity entity, UserHiveEntity? userEntity);
  CommunityMemberHiveEntity? getCommunityMemberEntity(String id);
  Future deleteCommunityMemberEntity(CommunityMemberHiveEntity entity);
  CommunityMemberHiveEntity getCommunityMemberEntities(
      String communityId,
      List<String> roles,
      List<String> memberships,
      AmityMembershipSortOption sortOption);
  Stream<CommunityMemberHiveEntity> listenCommnunityMemberEntity(String id);
}
