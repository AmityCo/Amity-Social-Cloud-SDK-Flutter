import 'package:amity_sdk/src/core/socket/event/message/message_event_listener.dart';

class MessageCreatedEventListener extends MessageEventListener {
  
  @override
  String getEventName() {
    return 'message.created';
  }

  @override
  bool shouldProcessEvent(Map<String, dynamic> json) {
    return true;
  }
}
