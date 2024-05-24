import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';

extension StoryTargetHiveExtentionConverter on StoryTargetHiveEntity {
  AmityStoryTarget convertToAmityStoryTarget() {

    if(targetId ==null && key !=null){
      targetId = key.split("/")[1];
      targetType = key.split("/")[0];
      targetPublicId = key.split("/")[1];
    }
    AmityStoryTargetType storytargetType =
        AmityStoryTargetTypeExtension.enumOf(targetType);
    switch (storytargetType) {
      case AmityStoryTargetType.COMMUNITY:
        return AmityStoryTargetCommunity(
            targetId: targetId!,
            targetPublicId: targetPublicId,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: false,
            updatedAt: targetUpdatedAt,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt);
      case AmityStoryTargetType.USER:
        return AmityStoryTargetUser(
            targetId: targetId!,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: false,
            updatedAt: targetUpdatedAt,
            targetPublicId: targetPublicId,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt);
      default:
        return AmityStoryTargetUnknown(
            targetId: targetId!,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: false,
            updatedAt: targetUpdatedAt,
            targetPublicId: targetPublicId,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt);
    }
  }

  bool isMatchingFilter(GetTargetsByTargetsRequest request) {
    return isMatchingTarget(request.targets); 
  }


  bool isMatchingTarget(List<StoryTargetSearchInfo>? targets){
    if(targets == null) return false;
    for (var target in targets!) {
      if(target.targetType.value == targetType && target.targetId == targetId){
        return true;
      }
    }
    return false;
  }
}
