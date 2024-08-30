import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';

abstract class 
StoryTargetDbAdapter {
  Future saveStoryTargetEntity(StoryTargetHiveEntity data);

  Future deleteStoryTargetEntity(String uniqueId);

  Future deleteAllStoryTargetEntity();

  Future updateStoryTargetLocalLastStoryExpiresAt(
    AmityStoryTargetType targetType,
    String targetId,
    DateTime? localLastStoryExpiresAt,
  );

  StoryTargetHiveEntity? getStoryTargetEntity(String uniqueId);

  Stream<List<StoryTargetHiveEntity>> listenStoryTargetEntities(
      RequestBuilder<GetTargetsByTargetsRequest> request);
  
  Stream<List<StoryTargetHiveEntity>> listenAllStoryTargetEntities();

  Stream<StoryTargetHiveEntity> listenStoryTargetEntity(String uniqueId);

  StoryTargetHiveEntity? getStoryTarget(
      String uniqueId);


  Future? triggerChange();

  Future createStoryTarget(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime? lastStoryExpiresAt,
      DateTime? localLastStoryExpiresAt,
      DateTime? lastStorySeenExpiresAt,
      DateTime? localLastStorySeenExpiresAt);

  Future updateStoryTargetLocalSortingDate(AmityStoryTargetType targetType,
      String targetId, bool hasUnseen, DateTime? localSortingDate);
  Future updateStoryTargetLastStoryExpiresAt(AmityStoryTargetType targetType, String targetId, DateTime? lastStoryExpiresAt);

  Future updateStoryTargetLocalLastStorySeenExpiresAt(AmityStoryTargetType targetType, String targetId, DateTime? localLastStorySeenExpiresAt);
}
