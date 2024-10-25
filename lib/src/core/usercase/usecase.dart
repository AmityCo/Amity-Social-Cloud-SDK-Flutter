import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';

abstract class UseCase<Type, Params> {
  Future<Type> get(Params params);
  // Stream<Type> listen(Params params);
}

abstract class UseCaseWithOptionalReturnValue<Type, Params> {
  Future<Type?> get(Params params);
  // Stream<Type> listen(Params params);
}

abstract class UseCaseWithoutParam<Type> {
  Future<Type> get();
}

abstract class SynchronousUseCase<Type, Params> {
  Type get(Params params);
}

abstract class ObserverUseCase<Type, Params> {
  StreamController<Type> listen(RequestBuilder<Params> request);
}

abstract class ProcessingUseCase<Type, Params> {
  Future<Type> process(Params params);
  // Stream<Type> listen(Params params);
}