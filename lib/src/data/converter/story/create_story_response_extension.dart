import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/data/converter/file_response_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/story/story_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/story/story_response_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_reposnse_conveter_extension.dart';
import 'package:amity_sdk/src/data/converter/user_response_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_hive_entity_27.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/data/response/create_story_response.dart';
import 'package:amity_sdk/src/data/converter/reaction_response_extension_converter.dart';
import 'package:collection/collection.dart';

enum StoryMqttEvent { addReaction, removeReaction }

extension CreateStoryResponseExtension on CreateStoryResponse {
  Future saveToDb<T>(DbAdapterRepo dbRepo, {StoryMqttEvent? event}) async {
    List<FileHiveEntity> fileHiveEntities = files.map((e) => e.convertToFileHiveEntity()).toList();

    List<UserHiveEntity> userHiveEntities = users.map((e) => e.convertToUserHiveEntity()).toList();

    List<StoryHiveEntity> storyHiveEntities = stories.map((e) => e.convertToStoryHiveEntity()).toList();

    List<StoryTargetHiveEntity> storyTargetHiveEntities = storyTargets.map((e) => e.convertToStoryTargetHiveEntity()).toList();

    for (var e in fileHiveEntities) {
      await dbRepo.fileDbAdapter.saveFileEntity(e);
    }

    for (var e in userHiveEntities) {
      await dbRepo.userDbAdapter.saveUserEntity(e);
    }

    for (var e in storyHiveEntities) {
      e.syncState = AmityStorySyncState.SYNCED.value;
      await dbRepo.storyDbAdapter.saveStoryEntity(e);
    }

    for (var e in storyTargetHiveEntities) {
      await dbRepo.storyTargetDbAdapter.saveStoryTargetEntity(e);
    }
    if(event!=null){
      var firstStory = stories.first;
      var reactors = reactions.first;
      var story = dbRepo.storyDbAdapter.getStoryEntity(firstStory.storyId!);
     
      if (event == StoryMqttEvent.addReaction) {
       await dbRepo.reactionDbAdapter.saveReactionEntity(reactors.convertToReactionHiveEntity(AmityReactionReferenceType.STORY.toString(), story!.storyId!));
      var haveUserReact = reactors.userId == AmityCoreClient.getCurrentUser().userId;
      if (haveUserReact) {
        if (story?.myReactions == null) {
          story?.myReactions = [reactors.reactionName];
        } else {
          story?.myReactions!.add(reactors.reactionName);
        }
      }
      story?.reactionsCount = story?.reactionsCount == null ? 1 : story.reactionsCount ?? 0 + 1;
      print('story?.reactionsCount in create  ${story?.reactionsCount}');
      await dbRepo.storyDbAdapter.saveStoryEntity(story!);
    } else if (event == StoryMqttEvent.removeReaction) {

       print('story?.reactionsCount in removeReaction  ${story?.reactionsCount}');
      var haveUserReact = reactors.userId == AmityCoreClient.getCurrentUser().userId;
      if (haveUserReact) {
        if (story?.myReactions == null) {
          story?.myReactions = [];
        } else {
          story?.myReactions!.removeWhere((element) => reactors.reactionName == element);
        }
      }
      await dbRepo.reactionDbAdapter.saveReactionEntity(reactors.convertToReactionHiveEntity(AmityReactionReferenceType.STORY.toString(), story!.storyId!));
      story?.reactionsCount = story?.reactionsCount == null ? 0 : story.reactionsCount ?? 0 - 1;
      await dbRepo.storyDbAdapter.saveStoryEntity(story!);
    }
    }
    

    if (T.toString() == 'AmityStory') {
      return storyHiveEntities.map((e) => e.convertToAmityStory()).toList();
    }
  }
}
