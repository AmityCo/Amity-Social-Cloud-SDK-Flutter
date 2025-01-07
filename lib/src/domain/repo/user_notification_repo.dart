import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_settings.dart';

abstract class UserNotificationRepo{
  Future<AmityUserNotificationSettings> getSetting(GetNotificationSettingsRequest request);
  Future<void> saveSettings(UserNotificationSettings request);
}