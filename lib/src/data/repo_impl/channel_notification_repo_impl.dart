import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/mapper/push_notification_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/channel_notification_api_interface.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_channel_notification_settings.dart';
import 'package:amity_sdk/src/domain/repo/channel_notification_repo.dart';

class ChannelNotificationRepoImpl extends ChannelNotificationRepo{
  ChannelNotificationApiInterface channelNotificationApiInterface;

  ChannelNotificationRepoImpl({required this.channelNotificationApiInterface});



  @override
  Future<AmityChannelNotificationSettings> getSetting(GetNotificationSettingsRequest request) async  {
    var channelNotificationResponse = await channelNotificationApiInterface.getSetting(request);
    return PushNotificationMapper().mapToChannelNotificationSettings(channelNotificationResponse);
  }

  @override
  Future<void> saveSettings(ChannelNotificationSettings request) async  {
    return await channelNotificationApiInterface.saveSettings(request);
  }

}