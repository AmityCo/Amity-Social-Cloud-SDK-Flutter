import 'package:amity_sdk/src/core/socket/event/message/message_event_listener.dart';

class MessageDeletedEventListener extends MessageEventListener {
  @override
  String getEventName() {
    return 'message.deleted';
  }
}
