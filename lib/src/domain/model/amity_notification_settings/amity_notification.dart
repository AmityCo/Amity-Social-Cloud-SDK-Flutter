
import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_channel_notification.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification.dart';

class AmityNotification{

  AmityUserNotification user() {
    return AmityUserNotification();
  }

  AmityCommunityNotification community(String communityId) {
    return AmityCommunityNotification( communityId);
  }

  AmityChannelNotification channel(String channelId) {
    return AmityChannelNotification(channelId);
  }
  
}