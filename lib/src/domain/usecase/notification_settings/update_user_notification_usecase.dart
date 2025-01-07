import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/repo/user_notification_repo.dart';

class UpdateUserNotificationUseCase extends UseCase<void, UserNotificationSettings>{

  UserNotificationRepo userNotificationRepo;

  UpdateUserNotificationUseCase({required this.userNotificationRepo});

  @override
  Future<void> get(UserNotificationSettings params) {
    return userNotificationRepo.saveSettings(params);
  }
  

}