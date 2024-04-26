import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';

class StoryTaregtModalMapper extends ModelMapper<StoryTargetHiveEntity, AmityStoryTarget> {
  @override
  AmityStoryTarget map(StoryTargetHiveEntity entity) {
    return entity.convertToAmityStoryTarget();
  }

}