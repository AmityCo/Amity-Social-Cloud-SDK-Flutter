import 'package:amity_sdk/amity_sdk.dart';

abstract class SessionState {
  const SessionState();

  static const NotLoggedIn = _NotLoggedIn();
  static const Establishing = _Establishing();
  static const Established = _Established();
  static const TokenExpired = _TokenExpired();

  bool isTerminated() {
    return this is Terminated;
  }

}

class _NotLoggedIn extends SessionState {
  const _NotLoggedIn();

  @override
  String toString(){
    return "NotLoggedIn";
  }
}

class _Establishing extends SessionState {
  const _Establishing();

  @override
  String toString(){
    return "Establishing";
  }
}

class _Established extends SessionState {
  const _Established();

  @override
  String toString(){
    return "Established";
  }
}

class _TokenExpired extends SessionState {
  const _TokenExpired();

  @override
  String toString(){
    return "TokenExpired";
  }
}

class Terminated extends SessionState  {
  final AmityException? error;
  Terminated({ this.error });
}
