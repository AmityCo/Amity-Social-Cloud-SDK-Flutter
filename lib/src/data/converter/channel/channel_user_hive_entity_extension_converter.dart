import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/data/data.dart';

/// [ChannelUserHiveExtensionConverter]
extension ChannelUserHiveExtensionConverter on ChannelUserHiveEntity {
  ///
  AmityChannelMember convertToAmityChannelMember() {
    return AmityChannelMember()
      ..channelId = channelId
      ..membership = AmityMembershipTypeExtension.enumOf(membership!)
      ..userId = userId
      ..isMuted = isMuted
      ..isBanned = isBanned
      ..isDeleted = isDeleted
      ..roles = AmityRoles(roles: roles)
      ..permissions = AmityPermissions(permissions: permissions);
  }
}
