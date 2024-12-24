import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/user_notification_event_request_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_module.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_settings.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/get_user_notification_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/update_user_notification_usecase.dart';

class AmityUserNotification {

  AmityUserNotification();

  Future<AmityUserNotificationSettings> getSettings() {
    return GetUserNotificationUseCase(userNotificationRepo: serviceLocator()).get("user");
  }

  Future disable() async {
    UserNotificationSettings params = UserNotificationSettings(
      isPushNotifiable: false,
    );
    return UpdateUserNotificationUseCase(
            userNotificationRepo: serviceLocator())
        .get(params);
  }

  Future enable(List<UserNotificationModifier>? eventModifiers) async {
    UserNotificationSettings params = UserNotificationSettings(
      notifiableModules:
          UserNotificationEventRequestMapper().map(eventModifiers),
      isPushNotifiable: true,
    );
    return UpdateUserNotificationUseCase(
            userNotificationRepo: serviceLocator())
        .get(params);
  }
}
