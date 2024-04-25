import 'dart:core';
import 'dart:io';
import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/core/model/api_request/story_delete_by_id_request.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/model/analytics/amity_story_analytics.dart';
import 'package:amity_sdk/src/domain/usecase/story/create_image_story_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/story/create_video_story_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/story/delete_story_by_id_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/story/story_target_live_object_usecase.dart';

class AmityStoryRepository {
  StoryGetLiveObject live = StoryGetLiveObject();

  /* begin_public_function 
  id: story.create_image_story
  */
  /// Create Image Story
  Future createImageStory({
    required AmityStoryTargetType targetType,
    required String targetId,
    required File imageFile,
    List<AmityStoryItem>? storyItems,
    Map<String, dynamic>? metadata,
    required AmityStoryImageDisplayMode imageDisplayMode,
  }) async {
    return CreateImageStoryUseCase().createImageStory(targetType, targetId,
        imageFile, storyItems, metadata, imageDisplayMode);
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.create_video_story
  */
  /// Create Video Story
  Future createVideoStory({
    required AmityStoryTargetType targetType,
    required String targetId,
    required File videoFile,
    List<AmityStoryItem>? storyItems,
    Map<String, dynamic>? metadata,
  }) async {
    return CreateVideoStoryUseCase().createVideoStory(
        targetType, targetId, videoFile, storyItems, metadata);
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.get_active_stories
  */
  /// Get Active Stories
  AmityStoryGetQueryBuilder getActiveStories(
      {required String targetId,
      required AmityStoryTargetType targetType,
      AmityStorySortingOrder orderBy = AmityStorySortingOrder.LAST_CREATED}) {
    return AmityStoryGetQueryBuilder()
        .targetId(targetId)
        .targetType(targetType)
        .orderBy(orderBy);
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.get_stories_by_targets
  */
  /// Get Stories by Targets
  AmityStoryGetQueryBuilder getStoriesByTargets(
      {required List<StoryTargetSearchInfo> targets,
      AmityStorySortingOrder orderBy = AmityStorySortingOrder.LAST_CREATED}) {
    return AmityStoryGetQueryBuilder().targets(targets).orderBy(orderBy);
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.hard_delete_story
  */
  /// Hard Delete Story
  Future hardDeleteStory({required String storyId}) async {
    return serviceLocator<DeleteStroyByIdUsecas>()
        .get(StoryDeleteByIdRequest(storyId: storyId, permanentDelete: true));
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.soft_delete_story
  */
  /// Soft Delete Story
  Future softDeleteStory({required String storyId}) async {
    return serviceLocator<DeleteStroyByIdUsecas>()
        .get(StoryDeleteByIdRequest(storyId: storyId, permanentDelete: false));
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.getTargetsbyTargets request
  */
  /// getTarget By targets request object
  GetTargetsByTargetsRequest getStoryTargets({
    required List<StoryTargetSearchInfo> targets,
  }) {
    return GetTargetsByTargetsRequest(targets: targets);
  }
  /* end_public_function */

  /* begin_public_function 
  id: story.AmityStoryAnalytics
  */
  /// Get Story Analytics object to mark as seen or link clicked
  AmityStoryAnalytics analytics(AmityStory story) {
    return AmityStoryAnalytics(story);
  }
  /* end_public_function */
}
