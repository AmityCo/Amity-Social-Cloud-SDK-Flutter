import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/story/story_live_object_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/story/story_target_live_object_usecase.dart';

class StoryGetLiveObject{

  Stream<AmityStory> getStory(String storyId){
    return StoryLiveObjectUseCase().execute(storyId);
  }

  Stream<AmityStoryTarget> getStoryTaregt({required AmityStoryTargetType targetType , required String targetId}){
    return StoryTargetLiveObjectUsecase()
        .execute(AmityStoryTarget.generateUniqueId(targetType.value, targetId));
  }
}