import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/tombstone_type.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_hive_entity_27.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

import '../../composer_usecase/story_composer_usercase.dart';

class StoryLiveObjectUseCase extends LiveObjectUseCase<StoryHiveEntity , AmityStory>{
  @override
  AmityStory? composeModel(AmityStory model) {
    serviceLocator<StoryComposerUseCase>().get(model).then((value){
      return value;
    });
    return null;
  }

  @override
  AmityObjectRepository<StoryHiveEntity, AmityStory> createRepository() {
    return serviceLocator<StoryRepo>()  as AmityObjectRepository<StoryHiveEntity, AmityStory>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.STORY;
  }

}