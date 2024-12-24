import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class MessageLiveObjectUseCase  extends LiveObjectUseCase<MessageHiveEntity , AmityMessage>{
  @override
  AmityMessage? composeModel(AmityMessage model) {
    return model;
  }

  @override
  AmityObjectRepository<MessageHiveEntity, AmityMessage> createRepository() {
      return serviceLocator<MessageRepo>() as AmityObjectRepository<MessageHiveEntity, AmityMessage>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.USER;
  }

}