import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/mapper/push_notification_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/community_notification_api_interface.dart';
import 'package:amity_sdk/src/domain/repo/community_notification_repo.dart';

class CommunityNotificationRepoImpl extends CommunityNotificationRepo{
  CommunityNotificationApiInterface communityNotificationApiInterface;

  CommunityNotificationRepoImpl({required this.communityNotificationApiInterface});



  @override
  Future<AmityCommunityNotificationSettings> getSetting(GetNotificationSettingsRequest request) async  {
    var communityNotificationResponse = await communityNotificationApiInterface.getSetting(request);
    return PushNotificationMapper().mapToCommunityNotificationSettings(communityNotificationResponse);
  }

  @override
  Future<void> saveSettings(CommunityNotificationSettings request) async  {
    return await communityNotificationApiInterface.saveSettings(request);
  }

}