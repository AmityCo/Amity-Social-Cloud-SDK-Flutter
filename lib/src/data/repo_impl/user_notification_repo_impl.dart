import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/mapper/push_notification_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/user_notification_api_interface.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_settings.dart';
import 'package:amity_sdk/src/domain/repo/user_notification_repo.dart';

class UserNotificationRepoImpl extends UserNotificationRepo{
  UserNotificationApiInterface userNotificationApiInterface;

  UserNotificationRepoImpl({required this.userNotificationApiInterface});

  @override
  Future<AmityUserNotificationSettings> getSetting(GetNotificationSettingsRequest request) async  {
    var userNotificationResponse = await userNotificationApiInterface.getSetting(request);
    return PushNotificationMapper().mapToUserNotificationSettings(userNotificationResponse);
  }

  @override
  Future<void> saveSettings(UserNotificationSettings request) async  {
    return await userNotificationApiInterface.saveSettings(request);
  }

}