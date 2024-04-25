import 'package:amity_sdk/src/core/enum/tombstone_type.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class PollLiveObjectUseCase extends LiveObjectUseCase<PollHiveEntity , AmityPoll>{
  
  @override
  AmityPoll? composeModel(AmityPoll model)  {
    return model;
  }

  @override
  AmityObjectRepository<PollHiveEntity, AmityPoll> createRepository() {
     return serviceLocator<PollRepo>() as AmityObjectRepository<PollHiveEntity, AmityPoll>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.POLL;
  }

}