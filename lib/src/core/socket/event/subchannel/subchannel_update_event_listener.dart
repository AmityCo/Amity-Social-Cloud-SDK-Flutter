import 'package:amity_sdk/src/core/socket/event/subchannel/subchannel_event_listener.dart';

class SubChannelUpdateEventListener extends SubChannelEventListener  {
  @override
  String getEventName() {
    return 'message-feed.updated';
  }
  
}