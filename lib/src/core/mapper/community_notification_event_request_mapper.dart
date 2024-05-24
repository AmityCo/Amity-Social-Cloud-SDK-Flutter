import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/notifiable_events_request.dart';

class CommunityNotificationEventRequestMapper{
  List<NotifiableEventsRequest>? map(List<CommunityNotificationModifier>? events) {
      return  events?.map((eventItem){
          return NotifiableEventsRequest(
              name: eventItem.eventName.value,
              isPushNotifiable: eventItem.isEnabled,
              listenFromRoleIds: eventItem.includedRoles?.roles ?? [],
              ignoreFromRoleIds: eventItem.excludedRoles?.roles ?? [],
          );
      }).toList();
    }
}