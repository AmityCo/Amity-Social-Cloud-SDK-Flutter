import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/amity_story_target_type.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/core/utils/live_collection.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/db_adapter/story_target_db_adapter.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class StoryTargetDbAdapterImpl extends StoryTargetDbAdapter {
  /// Db Client
  final DBClient dbClient;

  /// Story Target Box
  late Box<StoryTargetHiveEntity> box;

  StoryTargetDbAdapterImpl({required this.dbClient});

  /// Init [StoryTargetDbAdapterImpl]
  Future<StoryTargetDbAdapter> init() async {
    Hive.registerAdapter(StoryTargetHiveEntityAdapter(), override: true);
    box = await Hive.openBox<StoryTargetHiveEntity>('Story_Target_db');
    return this;
  }

  @override
  Future deleteAllStoryTargetEntity() async {
    for (var element in box.values) {
      element.delete();
    }
  }

  @override
  Future deleteStoryTargetEntity(String uniqueId) async {
    return box.delete(uniqueId);
  }

  @override
  StoryTargetHiveEntity? getStoryTargetEntity(String uniqueId) {
    return box.values.firstWhere((element) => element.getId() == uniqueId);
  }

  @override
  Future saveStoryTargetEntity(StoryTargetHiveEntity data) async {
    return box.put(data.uniqueId, data);
  }

  @override
  Stream<List<StoryTargetHiveEntity>> listenStoryTargetEntities(
      RequestBuilder<GetTargetsByTargetsRequest> request) {
    return box.watch().map((event) => box.values
        .where((storyTarget) => storyTarget.isMatchingFilter(request.call())
            //missing tags
            )
        .toList());
  }

  @override
  Stream<StoryTargetHiveEntity> listenStoryTargetEntity(String uniqueId) {
    return box.watch(key: uniqueId).map((event) => event.value);
  }

  @override
  Future updateStoryTargetLocalSortingDate(AmityStoryTargetType targetType,
      String targetId, bool hasUnseen, DateTime? localSortingDate) async  {
    var storyTarget = box.values.firstWhere((element) =>
        element.targetId == targetId && element.targetType == targetType.value);
    storyTarget.hasUnseen = hasUnseen;
    storyTarget.localSortingDate = localSortingDate;
    box.put(storyTarget.uniqueId, storyTarget);
  }

  @override
  Future updateStoryTargetLocalLastStoryExpiresAt(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime localLastStoryExpiresAt) {
    var storyTarget = box.values.firstWhere((element) =>
        element.targetId == targetId && element.targetType == targetType.value);
    storyTarget.localLastStoryExpiresAt = localLastStoryExpiresAt;
    return box.put(storyTarget.uniqueId, storyTarget);
  }

  @override
  StoryTargetHiveEntity? getStoryTarget(
      String uniqueId) {
    var storyTarget = box.values.firstWhereOrNull((element) =>
        element.getId() == uniqueId);
    return storyTarget;
  }

  @override
  Future createStoryTarget(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime? lastStoryExpiresAt,
      DateTime? localLastStoryExpiresAt,
      DateTime? lastStorySeenExpiresAt,
      DateTime? localLastStorySeenExpiresAt) {
    var storyTarget = StoryTargetHiveEntity(
      uniqueId: AmityStoryTarget.generateUniqueId(targetType.value, targetId),
      targetType: targetType.value,
      targetId: targetId,
      lastStoryExpiresAt: lastStoryExpiresAt,
      localLastStoryExpiresAt: localLastStoryExpiresAt,
      lastStorySeenExpiresAt: lastStorySeenExpiresAt,
      localLastStorySeenExpiresAt: localLastStorySeenExpiresAt,
    );

    if (localLastStoryExpiresAt != null) {
      if (localLastStoryExpiresAt.isAfter(DateTime.now())) {
        storyTarget.hasUnseen = true;
      }
    }

    return saveStoryTargetEntity(storyTarget);
  }
  
  @override
  Future updateStoryTargetLastStoryExpiresAt(AmityStoryTargetType targetType, String targetId, DateTime? lastStoryExpiresAt) async {
    var storyTarget = box.values.firstWhere((element) =>
        element.targetId == targetId && element.targetType == targetType.value);
    storyTarget.lastStoryExpiresAt = lastStoryExpiresAt;
    return box.put(storyTarget.uniqueId, storyTarget);
  }
  
  @override
  Future updateStoryTargetLocalLastStorySeenExpiresAt(AmityStoryTargetType targetType, String targetId, DateTime? localLastStorySeenExpiresAt) {
    var storyTarget = box.values.firstWhere((element) =>
        element.targetId == targetId && element.targetType == targetType.value);
    storyTarget.localLastStorySeenExpiresAt = localLastStorySeenExpiresAt;
    return box.put(storyTarget.uniqueId, storyTarget);
  }
}
