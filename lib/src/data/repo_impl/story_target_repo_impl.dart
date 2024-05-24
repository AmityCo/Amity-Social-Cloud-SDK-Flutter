import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/story_target_model_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_story_target_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/core/utils/page_list_data.dart';
import 'package:amity_sdk/src/data/converter/story_target/get_global_story_target_response_extension.dart';
import 'package:amity_sdk/src/data/converter/story_target/get_target_by_target_response_extension.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/story_target_api_interface.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryTargetRepoImpl extends StoryTargetRepo {
  final DbAdapterRepo dbAdapterRepo;
  final StoryTargetApiInterface storyTargetApiInterface;
  

  StoryTargetRepoImpl(
      {required this.dbAdapterRepo, required this.storyTargetApiInterface });

  @override
  Future<AmityStoryTarget> getStoryTarget(
      GetTargetsByTargetsRequest request) async {
    final data = await storyTargetApiInterface.queryStoryTargets(request);
    var storyTargets = await data.saveToDb<AmityStoryTarget>(dbAdapterRepo);
    return storyTargets[0];
  }

  @override
  Future<List<AmityStoryTarget>> getStoryTargets(
      GetTargetsByTargetsRequest request) async {
    final data = await storyTargetApiInterface.queryStoryTargets(request);
    var storyTargets = await data.saveToDb<AmityStoryTarget>(dbAdapterRepo);
    return storyTargets;
  }

  @override
  Future<AmityStoryTarget?> fetchAndSave(String objectId) async {
    var targetSplit = objectId.split('/');
    var targetType = targetSplit[0];
    var targetId = targetSplit[1];
    var storyTarget = await getStoryTarget(GetTargetsByTargetsRequest(targets: [
      StoryTargetSearchInfo(
          targetId: targetId,
          targetType: AmityStoryTargetTypeExtension.enumOf(targetType))
    ]));
    if (storyTarget != null) {
      return storyTarget;
    } else {
      return Future.value(null);
    }
  }

  @override
  ModelMapper<StoryTargetHiveEntity, AmityStoryTarget> mapper() {
    return StoryTaregtModalMapper();
  }

  @override
  StreamController<StoryTargetHiveEntity> observeFromCache(String objectId) {
    final streamController = StreamController<StoryTargetHiveEntity>();
    dbAdapterRepo.storyTargetDbAdapter
        .listenStoryTargetEntity(objectId)
        .listen((event) {
      streamController.add(event);
    });
    return streamController;
  }

  @override
  Future<StoryTargetHiveEntity?> queryFromCache(String objectId) async {
    return dbAdapterRepo.storyTargetDbAdapter.getStoryTargetEntity(objectId);
  }

  @override
  Future updateStoryTargetHasUnseen(AmityStoryTargetType targetType,
      String targetId, bool hasUnseen, DateTime? localSortingDate) async {
    dbAdapterRepo.storyTargetDbAdapter.updateStoryTargetLocalSortingDate(
        targetType, targetId, hasUnseen, localSortingDate);
  }

  @override
  Stream<List<AmityStoryTarget>> listenStoryTargets(
      RequestBuilder<GetTargetsByTargetsRequest> request) {
    return dbAdapterRepo.storyTargetDbAdapter
        .listenStoryTargetEntities(request)
        .map((event) {
      final req = request.call();
      final List<AmityStoryTarget> list = [];

      for (var element in event) {
        list.add(element.convertToAmityStoryTarget());
      }
      return list;
    });
  }

  @override
  Future updateStoryTargetLocalLastStoryExpiresAt(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime localLastStoryExpiresAt) {
    if (dbAdapterRepo.storyTargetDbAdapter.getStoryTarget(
            AmityStoryTarget.generateUniqueId(targetType.value, targetId)) !=
        null) {
      return dbAdapterRepo.storyTargetDbAdapter
          .updateStoryTargetLocalLastStoryExpiresAt(
              targetType, targetId, localLastStoryExpiresAt);
    } else {
      return dbAdapterRepo.storyTargetDbAdapter.createStoryTarget(
          targetType, targetId, null, localLastStoryExpiresAt, null, null);
    }
  }

  @override
  Future updateStoryTargetLastStoryExpiresAt(AmityStoryTargetType targetType,
      String targetId, DateTime? lastStoryExpiresAt) {
    return dbAdapterRepo.storyTargetDbAdapter
        .updateStoryTargetLastStoryExpiresAt(
            targetType, targetId, lastStoryExpiresAt);
  }

  @override
  AmityStoryTarget? getStoryTargetLocal(
      AmityStoryTargetType targetType, String targetId) {
    return dbAdapterRepo.storyTargetDbAdapter
        .getStoryTarget(
            AmityStoryTarget.generateUniqueId(targetType.value, targetId))
        ?.convertToAmityStoryTarget();
  }

  @override
  Future updateStoryTargetLocalLastStorySeenExpiresAt(
      AmityStoryTargetType targetType,
      String targetId,
      DateTime? localLastStorySeenExpiresAt) {
    return dbAdapterRepo.storyTargetDbAdapter
        .updateStoryTargetLocalLastStorySeenExpiresAt(
            targetType, targetId, localLastStorySeenExpiresAt);
  }

  @override
  Future<PageListData<List<AmityStoryTarget>, String>> getGlobalFeed(
      GetGlobalStoryTargetRequest request) async {
    final data = await storyTargetApiInterface.queryGlobalFeed(request);

    final amitStroyTarget =
        await data.saveToDb<AmityStoryTarget>(dbAdapterRepo);


    if(request.token == null && amitStroyTarget.isEmpty){
      dbAdapterRepo.storyTargetDbAdapter.triggerChange();
    }
    String token = data.paging!.next ?? '';

    if (token.isEmpty &&
        request.isSmartState &&
        request.seenState == AmityGlobalStoryTargetsQueryOption.UNSEEN.value) {
      token = "next";
      print("TOKEN NEXTED -----> $token");
    }
    //SEEN

    return PageListData(amitStroyTarget, token);
  }

  @override
  Stream<List<AmityStoryTarget>> listenAllStoryTargets( ) {
    return dbAdapterRepo.storyTargetDbAdapter
        .listenAllStoryTargetEntities()
        .map((event) {
      List<AmityStoryTarget> list = [];
      for (var element in event) {
        print("ELEMENT LISTEN ALL STORY TARGETS $element.targetId");
        list.add(element.convertToAmityStoryTarget());
        
      }
      return list;
    });
  }
}
