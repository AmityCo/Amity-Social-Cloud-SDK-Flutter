import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/data/response/get_notification_settings_response.dart';

abstract class UserNotificationApiInterface{

  Future<GetNotificationSettingsResponse> getSetting(GetNotificationSettingsRequest request);
  Future<void> saveSettings(UserNotificationSettings request);

}