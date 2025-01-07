import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_notification_settings_request.dart';
import 'package:amity_sdk/src/data/repo_impl/channel_notification_repo_impl.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_channel_notification_settings.dart';
import 'package:amity_sdk/src/domain/repo/channel_notification_repo.dart';

class GetChannelNotificationUseCase extends UseCase<AmityChannelNotificationSettings, String>{


  ChannelNotificationRepo channelNotificationRepo;

  GetChannelNotificationUseCase({required this.channelNotificationRepo});

  @override
  Future<AmityChannelNotificationSettings> get(String params) {
    var request = GetNotificationSettingsRequest(level: 'channel' , channelId: params);
    return channelNotificationRepo.getSetting(request);
  }

}