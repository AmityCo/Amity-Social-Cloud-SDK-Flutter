import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/save_notification_settings_request.dart';
import 'package:amity_sdk/src/domain/repo/channel_notification_repo.dart';

class UpdateChannelNotificationUseCase extends UseCase<void, ChannelNotificationSettings>{

  ChannelNotificationRepo channelNotificationRepo;

  UpdateChannelNotificationUseCase({required this.channelNotificationRepo});

  @override
  Future<void> get(ChannelNotificationSettings params) {
    return channelNotificationRepo.saveSettings(params);
  }
  

}