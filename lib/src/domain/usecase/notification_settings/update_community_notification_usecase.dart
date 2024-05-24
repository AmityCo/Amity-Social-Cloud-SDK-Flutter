import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/community_notification_event_request_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/repo/community_notification_repo.dart';

class UpdateCommunityNotificationUseCase extends UseCase<void, CommunityNotificationSettings>{

  CommunityNotificationRepo communityNotificationRepo;

  UpdateCommunityNotificationUseCase({required this.communityNotificationRepo});

  @override
  Future<void> get(CommunityNotificationSettings params) {
  // CommunityNotificationSettings  finalParams = CommunityNotificationSettings(
  //     communityId: params.communityId,
  //     notifiableEvents: CommunityNotificationEventRequestMapper().map(params.eventModifiers), 
  //     isPushNotifiable: params.isEnabled,
  // );
    return communityNotificationRepo.saveSettings(params);
  }
  

}







// class UpdateCommunityNotificationRequest {
//   final String communityId;
//   final bool isEnabled;
//   final List<CommunityNotificationModifier>? eventModifiers;

//   UpdateCommunityNotificationRequest({
//     required this.communityId,
//     required this.isEnabled,
//     this.eventModifiers,
//   });
// }