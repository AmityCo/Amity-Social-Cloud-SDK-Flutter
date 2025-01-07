import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class ChannelLiveObjectUseCase  extends LiveObjectUseCase<ChannelHiveEntity , AmityChannel>{
  @override
  AmityChannel? composeModel(AmityChannel model) {
    return model;
  }

  @override
  AmityObjectRepository<ChannelHiveEntity, AmityChannel> createRepository() {
      return serviceLocator<ChannelRepo>() as AmityObjectRepository<ChannelHiveEntity, AmityChannel>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.CHANNEL;
  }

}