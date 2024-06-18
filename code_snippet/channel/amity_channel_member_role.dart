import 'package:amity_sdk/amity_sdk.dart';

class AmityChannelMemberRole {
  /* begin_sample_code
    gist_id: 0a12c57735cb8828f0439a240e07b1c6
    filename: AmityChannelMemberRole.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter add/remove channel member roles example
    */
  void addOrRemoveChannelMemberRole() {
    final channelId = "channelId";
    final role = "moderator";
    final userIds = List.of(['user1', 'user2']);

    // Add role to channel members
    AmityChatClient.newChannelRepository()
      .moderation(channelId)
      .addRole(role, userIds)
      .then((value) => {
            //handle result
          })
      .onError((error, stackTrace) => {
            //handle error
          });

    // Remove role from channel members
    AmityChatClient.newChannelRepository()
      .moderation(channelId)
      .removeRole(role, userIds)
      .then((value) => {
            //handle result
          })
      .onError((error, stackTrace) => {
            //handle error
          });
  }
  /* end_sample_code */
}
