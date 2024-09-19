
import 'package:amity_sdk/src/core/session/event_bus/base_state_event_bus.dart';
import 'package:amity_sdk/src/domain/model/session/session_state.dart';

class SessionStateEventBus extends BaseStateEventBus<SessionState>{
  static final SessionStateEventBus _instance = SessionStateEventBus._internal();

  factory SessionStateEventBus() => _instance;

  SessionStateEventBus._internal();

  

}