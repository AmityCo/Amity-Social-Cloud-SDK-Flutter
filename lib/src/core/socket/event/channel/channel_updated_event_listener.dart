import 'package:amity_sdk/src/core/socket/event/channel/channel_event_listener.dart';

class ChannelUpdatedEventListener extends ChannelEventListener {

  @override
  String getEventName() {
    return 'channel.updated';
  }
}