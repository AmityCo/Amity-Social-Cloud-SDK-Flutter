import 'package:amity_sdk/src/core/socket/event/message/message_event_listener.dart';

class MessageUpdatedEventListener extends MessageEventListener {
  @override
  String getEventName() {
    return 'message.updated';
  }
}
