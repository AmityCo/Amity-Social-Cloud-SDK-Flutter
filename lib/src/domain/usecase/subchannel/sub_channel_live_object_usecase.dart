import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/enum/tombstone_type.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelLiveObjectUseCase  extends LiveObjectUseCase<SubChannelHiveEntity , AmitySubChannel>{
  @override
  AmitySubChannel? composeModel(AmitySubChannel model) {
    return model;
  }

  @override
  AmityObjectRepository<SubChannelHiveEntity, AmitySubChannel> createRepository() {
      return serviceLocator<SubChannelRepo>() as AmityObjectRepository<SubChannelHiveEntity, AmitySubChannel>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.SUB_CHANNEL;
  }

}