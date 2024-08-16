import 'package:amity_sdk/src/data/data_source/local/hive_entity/community_member_hive_entity_14.dart';
import 'package:amity_sdk/src/domain/domain.dart';

extension CommunityMemberHiveEntityExtension on CommunityMemberHiveEntity {
  AmityCommunityMember convertToAmityCommunityMember() {
    return AmityCommunityMember()
      ..communityId = communityId
      ..channelId = channelId
      ..userId = userId
      ..roles = roles
      ..isBanned = isBanned
      ..isDeleted = isDeleted ?? false; // If isDeleted is null, set it to false to avoid null value
  }
}
