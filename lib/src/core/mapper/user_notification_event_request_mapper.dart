import 'package:amity_sdk/src/core/model/api_request/notifiable_events_request.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_module.dart';

class UserNotificationEventRequestMapper{
  List<NotifiableEventsRequest>? map(List<UserNotificationModifier>? modules) {
      return  modules?.map((moduleItem){
          return NotifiableEventsRequest(
              name: moduleItem.eventName.value,
              isPushNotifiable: moduleItem.isEnabled,
              listenFromRoleIds: moduleItem.includedRoles?.roles ?? [],
              ignoreFromRoleIds: moduleItem.excludedRoles?.roles ?? [],
          );
      }).toList();
    }
}