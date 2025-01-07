import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_channel_notification_settings.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/get_channel_notification_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/update_channel_notification_usecase.dart';

class AmityChannelNotification {
  String channelId;

  AmityChannelNotification(this.channelId);

  Future<AmityChannelNotificationSettings> getSettings() {
    return GetChannelNotificationUseCase(
            channelNotificationRepo: serviceLocator())
        .get(channelId);
  }

  Future disable() async {
    ChannelNotificationSettings params = ChannelNotificationSettings(
      channelId: channelId,
      isPushNotifiable: false,
    );
    return UpdateChannelNotificationUseCase(
            channelNotificationRepo: serviceLocator())
        .get(params);
  }

  Future enable() async {
    ChannelNotificationSettings params = ChannelNotificationSettings(
      channelId: channelId,
      isPushNotifiable: true,
    );
    return UpdateChannelNotificationUseCase(
            channelNotificationRepo: serviceLocator())
        .get(params);
  }
}
