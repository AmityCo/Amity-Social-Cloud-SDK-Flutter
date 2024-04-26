import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/create_stroy_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_stories_by_target_request.dart';
import 'package:amity_sdk/src/core/model/api_request/story_delete_by_id_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_hive_entity_27.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

abstract class 
StoryRepo
    extends AmityObjectRepository<StoryHiveEntity, AmityStory> {
  Future<AmityStory> createStory(CreateStoryRequest request);
  Future<List<AmityStory>> getStories(GetStoriesByTragetRequest request);
  Stream<List<AmityStory>> listenStories(
      RequestBuilder<GetStoriesByTragetRequest> request);
  bool hasLocalStory(String storyId);
  Future<bool> deleteStoryById(StoryDeleteByIdRequest params);
  Future<AmityStory> getStoryById(String storyId);
  List<AmityStory> getFailedStories( String targetType, String targetId);
  int getSyncingStoriesCount(AmityStoryTargetType targetType, String targetId);

  int getFailedStoriesCount(AmityStoryTargetType targetType, String targetId);

  DateTime? getHighestStoryExpiresAt(
      AmityStoryTargetType targetType, String targetId);

  DateTime? getHighestSyncedStoryExpiresAt(
      AmityStoryTargetType targetType, String targetId);

}
