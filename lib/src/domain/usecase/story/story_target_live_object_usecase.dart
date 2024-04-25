import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_target_composer_usecase.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryTargetLiveObjectUsecase extends LiveObjectUseCase<StoryTargetHiveEntity , AmityStoryTarget>{
  @override
  AmityStoryTarget? composeModel(AmityStoryTarget model) {
    serviceLocator<StoryTargetComposerUseCase>().get(model).then((value){
      return value;
    });
    return null;
  }

  @override
  AmityObjectRepository<StoryTargetHiveEntity, AmityStoryTarget> createRepository() {
    return serviceLocator<StoryTargetRepo>()  as AmityObjectRepository<StoryTargetHiveEntity, AmityStoryTarget>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.STORY_TARGET;
  }
  
}