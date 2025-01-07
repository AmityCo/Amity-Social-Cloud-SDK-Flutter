import 'package:amity_sdk/src/core/socket/event/message/message_event_listener.dart';

class MessageFlaggedEventListener extends MessageEventListener {
  @override
  String getEventName() {
    return 'message.flagged';
  }
}
