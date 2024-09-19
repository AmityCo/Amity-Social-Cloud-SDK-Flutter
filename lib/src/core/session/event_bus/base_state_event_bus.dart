import 'dart:async';

import 'package:amity_sdk/src/core/session/event_bus/base_event_bus.dart';

class BaseStateEventBus<T> extends BaseEventBus<T> {

  @override
  Stream<T> observe(){
    stream ??= controller.stream.asBroadcastStream();
    final currentState = getCurrentEvent();
    if (currentState != null) {
      controller.add(currentState);
    }
    return stream!;
  }

}