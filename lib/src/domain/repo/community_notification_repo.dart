import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';

abstract class CommunityNotificationRepo{
  Future<AmityCommunityNotificationSettings> getSetting(GetNotificationSettingsRequest request);
  Future<void> saveSettings(CommunityNotificationSettings request);
}