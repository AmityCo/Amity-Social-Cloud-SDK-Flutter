import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_story_target_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/core/model/api_request/stream_query_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

abstract class StoryTargetRepo
    extends AmityObjectRepository<StoryTargetHiveEntity, AmityStoryTarget> {
  Future<AmityStoryTarget> getStoryTarget(GetTargetsByTargetsRequest request);
  AmityStoryTarget? getStoryTargetLocal(AmityStoryTargetType targetType, String targetId);
  Future<List<AmityStoryTarget>> getStoryTargets(
      GetTargetsByTargetsRequest request);
  Future updateStoryTargetHasUnseen(AmityStoryTargetType targetType,
      String targetId, bool hasUnseen, DateTime? localSortingDate);

  Stream<List<AmityStoryTarget>> listenStoryTargets(
      RequestBuilder<GetTargetsByTargetsRequest> request);

  Stream<List<AmityStoryTarget>> listenAllStoryTargets( );

  Future updateStoryTargetLocalLastStoryExpiresAt(
    AmityStoryTargetType targetType,
    String targetId,
    DateTime? localLastStoryExpiresAt,
  );

  Future updateStoryTargetLocalLastStorySeenExpiresAt(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime? localLastStorySeenExpiresAt);

  Future updateStoryTargetLastStoryExpiresAt(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime? lastStoryExpiresAt);

  Future<PageListData<List<AmityStoryTarget>, String>> getGlobalFeed( GetGlobalStoryTargetRequest request);

}
