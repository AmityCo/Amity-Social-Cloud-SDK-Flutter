import 'package:amity_sdk/amity_sdk.dart';

class AmityChannelPermission {
  /* begin_sample_code
    gist_id: cabd602e8aa1f9b1bd2bcbdd561f799b
    filename: amity_channel_permission.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter add/remove channel member roles example
    */
  void checkChannelPermission() {
    final channelId = "channelId";
    final permission = AmityPermission.ADD_CHANNEL_USER;
    final isGranted = AmityCoreClient.hasPermission(permission)
      .atChannel(channelId)
      .check();
  }
  /* end_sample_code */
}
