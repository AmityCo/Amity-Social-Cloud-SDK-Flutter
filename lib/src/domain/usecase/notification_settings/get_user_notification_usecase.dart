import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_settings.dart';
import 'package:amity_sdk/src/domain/repo/user_notification_repo.dart';

class GetUserNotificationUseCase extends UseCase<AmityUserNotificationSettings, String>{

  UserNotificationRepo userNotificationRepo;

  GetUserNotificationUseCase({required this.userNotificationRepo});

  @override
  Future<AmityUserNotificationSettings> get(String params) {
    var request = GetNotificationSettingsRequest(level: 'user');
    return userNotificationRepo.getSetting(request);
  }

}