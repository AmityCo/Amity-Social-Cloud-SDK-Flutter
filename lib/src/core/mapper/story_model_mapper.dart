import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/story/story_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_hive_entity_27.dart';

class StoryModalMapper extends ModelMapper<StoryHiveEntity, AmityStory> {
  @override
  AmityStory map(StoryHiveEntity entity) {
    return entity.convertToAmityStory();
  }

}