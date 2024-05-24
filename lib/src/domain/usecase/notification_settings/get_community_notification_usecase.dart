import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/data/repo_impl/community_notification_repo_impl.dart';
import 'package:amity_sdk/src/domain/repo/community_notification_repo.dart';

class GetCommunityNotificationUseCase extends UseCase<AmityCommunityNotificationSettings, String>{


  CommunityNotificationRepo communityNotificationRepo;

  GetCommunityNotificationUseCase({required this.communityNotificationRepo});

  @override
  Future<AmityCommunityNotificationSettings> get(String params) {
    var request = GetNotificationSettingsRequest(level: 'community' , communityId: params);
    return communityNotificationRepo.getSetting(request);
  }

}