import 'package:amity_sdk/src/data/data.dart';

extension CommunityMemberResponseExtension on CommunityUserResponse {
  CommunityMemberHiveEntity convertToCommnityMemberHiveEntity() {
    return CommunityMemberHiveEntity()
      ..id = communityId + userId
      ..userId = userId
      ..communityId = communityId
      ..channelId = channelId
      ..communityMembership = communityMembership
      ..permissions = permissions
      ..roles = roles
      ..isBanned = isBanned;
  }
}
