import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/community_notification_event_request_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/get_community_notification_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/notification_settings/update_community_notification_usecase.dart';

class AmityCommunityNotification {
  String communityId;

  AmityCommunityNotification(this.communityId);

  Future<AmityCommunityNotificationSettings> getSettings() {
    return GetCommunityNotificationUseCase(
            communityNotificationRepo: serviceLocator())
        .get(communityId);
  }

  Future disable() async {
    CommunityNotificationSettings params = CommunityNotificationSettings(
      communityId: communityId,
      isPushNotifiable: false,
    );
    return UpdateCommunityNotificationUseCase(
            communityNotificationRepo: serviceLocator())
        .get(params);
  }

  Future enable(List<CommunityNotificationModifier>? eventModifiers) async {
    CommunityNotificationSettings params = CommunityNotificationSettings(
      communityId: communityId,
      notifiableEvents:
          CommunityNotificationEventRequestMapper().map(eventModifiers),
      isPushNotifiable: true,
    );
    return UpdateCommunityNotificationUseCase(
            communityNotificationRepo: serviceLocator())
        .get(params);
  }
}
