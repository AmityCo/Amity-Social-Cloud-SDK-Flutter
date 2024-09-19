

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/session/model/session_life_cycle.dart';

class SessionLifeCycleTransformer {
  static final SessionLifeCycleTransformer _instance = SessionLifeCycleTransformer._internal();

  factory SessionLifeCycleTransformer() {
    return _instance;
  }
  
  SessionLifeCycleTransformer._internal();
  
  SessionLifeCycle? transform(SessionState currentSessionState) {
    if (currentSessionState == SessionState.TokenExpired) {
      return SessionLifeCycle.HandleTokenExpire;
    } else if (currentSessionState.isTerminated() || currentSessionState == SessionState.NotLoggedIn) {
      return SessionLifeCycle.Destroy;
    } else {
      return null;
    }
  }
}