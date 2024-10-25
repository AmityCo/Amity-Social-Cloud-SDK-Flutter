import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/core/socket/event/socket_event_listener.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/usecase/channel/channel_has_local_usecase.dart';


abstract class ChannelEventListener extends SocketEventListener {
  @override
  void processEvent(Map<String, dynamic> json) {
    final data = CreateChannelResponse.fromJson(json);

    data.saveToDb(serviceLocator());
  }

  /// This method is used to check if the event should be processed or not.
  @override
  bool shouldProcessEvent(Map<String, dynamic> json) {
    final data = CreateChannelResponse.fromJson(json);
    if (data.channels.isNotEmpty) {
      return _hasInLocal(data.channels[0].channelId);
    } else {
      return false;
    }
  }

  bool _hasInLocal(String channelId) {
    return serviceLocator<ChannelHasLocalUsecase>().get(channelId);
  }
}
