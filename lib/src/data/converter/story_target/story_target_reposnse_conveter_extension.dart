import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/data/response/core_response/story_target_response.dart';

extension StroyTargetResponseExtensionConverter on StoryTargetResponse{
  StoryTargetHiveEntity convertToStoryTargetHiveEntity() {

    return StoryTargetHiveEntity(
      uniqueId: AmityStoryTarget.generateUniqueId(targetType!, targetId!),
      targetId: targetId,
      targetPublicId: targetPublicId,
      targetType: targetType,
      lastStoryExpiresAt: lastStoryExpiresAt,
      lastStorySeenExpiresAt: lastStorySeenExpiresAt,
      targetUpdatedAt: targetUpdatedAt,
      hasUnseen: false,
      localSortingDate: DateTime.now(),
      localLastStoryExpiresAt: lastStoryExpiresAt,
      localLastStorySeenExpiresAt: lastStorySeenExpiresAt
    );
  }
}


