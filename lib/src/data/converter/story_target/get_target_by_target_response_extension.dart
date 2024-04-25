import 'package:amity_sdk/src/data/converter/story_target/story_target_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_reposnse_conveter_extension.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/data/response/get_story_targets_by_targets_response.dart';

extension GetTragetsbyTargetsResponseExtension on GetStoryTargetsByTargets{
  Future saveToDb<T>(DbAdapterRepo dbRepo) async {
    List<StoryTargetHiveEntity> storyTargetHiveEntities = storyTargets.map((e) => e.convertToStoryTargetHiveEntity()).toList();
    for (var e in storyTargetHiveEntities) {
      await dbRepo.storyTargetDbAdapter.saveStoryTargetEntity(e);
    }
    
    if (T.toString() == 'AmityStoryTarget') {
      return storyTargetHiveEntities.map((e) => e.convertToAmityStoryTarget()).toList();
    }
  }
}