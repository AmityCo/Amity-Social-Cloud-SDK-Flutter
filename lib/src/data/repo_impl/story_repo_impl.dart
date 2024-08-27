import 'dart:async';
import 'dart:io';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/story_model_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/create_stroy_request.dart';
import 'package:amity_sdk/src/core/model/api_request/story_delete_by_id_request.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/story/create_story_response_extension.dart';
import 'package:amity_sdk/src/data/converter/story/story_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_hive_entity_27.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/story_api_interface.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryRepoImpl extends StoryRepo {
  final StoryApiInterface storyApiInterface;
  final DbAdapterRepo dbAdapterRepo;
  final FileRepo fileRepo;
  final StoryTargetRepo storyTargetRepo;

  StoryRepoImpl(
      {required this.storyApiInterface,
      required this.dbAdapterRepo,
      required this.fileRepo,
      required this.storyTargetRepo});

  @override
  Future<AmityStory> createStory(CreateStoryRequest request) async {
    var entity = request.convertToHiveEntity();
    // Update Story Target
    try {
      final AmityUploadResult<AmityFileInfo> amityUploadResult;
      final fileEntity = FileHiveEntity()
        ..fileId = request.referenceId
        ..filePath = request.uri!.path
        ..createdAt = DateTime.now();
      entity.data?.fileId = request.referenceId;
      dbAdapterRepo.fileDbAdapter.saveFileEntity(fileEntity);

      entity.syncState = AmityStorySyncState.CREATED.value;
      entity.expiresAt = DateTime.now().add(Duration(days: 365));
      await dbAdapterRepo.storyDbAdapter.saveStoryEntity(entity);
      
      storyTargetRepo.updateStoryTargetLocalLastStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(request.targetType!),
          request.targetId!,
          entity.expiresAt!);

      entity.syncState = AmityStorySyncState.SYNCING.value;
      await dbAdapterRepo.storyDbAdapter.saveStoryEntity(entity);

      switch (AmityStoryDataTypeExtension.enumOf(request.dataType!)) {
        case AmityStoryDataType.VIDEO:
          amityUploadResult = await fileRepo
              .uploadVidoe(UploadFileRequest(
                  files: [File(request.uri!.path)],
                  feedtype: AmityContentFeedType.STORY.value)
                ..uploadId = request.referenceId
                ..fullImage = true)
              .onError((error, stackTrace) {
            entity.syncState = AmityStorySyncState.FAILED.value;
            return Future.error(error!);
          });
          if (amityUploadResult is AmityUploadComplete) {
            var video =
                (amityUploadResult as AmityUploadComplete).file as AmityVideo;
            request.data?.fileId = video.fileId;
          }

          break;

        case AmityStoryDataType.IMAGE:
          amityUploadResult = await fileRepo
              .uploadImage(UploadFileRequest(files: [File(request.uri!.path)])
                ..uploadId = request.referenceId
                ..fullImage = true)
              .onError((error, stackTrace) {
            entity.syncState = AmityStorySyncState.FAILED.value;
            return Future.error(error!);
          });
          if (amityUploadResult is AmityUploadComplete) {
            var image =
                (amityUploadResult as AmityUploadComplete).file as AmityImage;
            request.data?.fileId = image.fileId;
          }
          break;

        default:
          throw Exception("Invalid data type");
      }

      /// Message Syncing
      entity.syncState = AmityStorySyncState.SYNCING.value;
      dbAdapterRepo.storyDbAdapter.saveStoryEntity(entity);

      final data = await storyApiInterface.createStory(request);
      final amitStory = await data.saveToDb<AmityStory>(dbAdapterRepo);

      return amitStory[0];
    } catch (error) {
      entity.syncState = AmityStorySyncState.FAILED.value;

      print("DELETE LOCAL STORY:  CREATE STORY ${entity.syncState} ${entity.referenceId} ${entity.storyId} ${entity.targetId} ${entity.targetType}");

      dbAdapterRepo.storyDbAdapter.saveStoryEntity(entity);
      entity = dbAdapterRepo.storyDbAdapter.getStoryEntity(entity.storyId!)!;
      storyTargetRepo.updateStoryTargetLocalLastStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(request.targetType!),
          request.targetId!,
          entity.expiresAt!);
      rethrow;
    }
  }

  @override
  Future<List<AmityStory>> getStories(GetStoriesByTragetRequest request) async {
    final data = await storyApiInterface.getStories(request);
    // dbAdapterRepo.storyDbAdapter.deleteAllStoryEntity();
    final amitStories = await data.saveToDb<AmityStory>(dbAdapterRepo);
    return amitStories;
  }

  @override
  Stream<List<AmityStory>> listenStories(
      RequestBuilder<GetStoriesByTragetRequest> request) {
        Stream<List<AmityStory>> storyStream = dbAdapterRepo.storyDbAdapter
        .listenStoryEntities(request)
        .map((event) {
      final req = request.call();
      final List<AmityStory> list = [];
      for (var element in event) {
        list.add(element.convertToAmityStory());
      }

      if (req.options!.orderBy == "desc") {
        list.sort((a, b) => a.createdAt!.compareTo(b.createdAt!) * -1);
      } else {
        list.sort((a, b) => a.createdAt!.compareTo(b.createdAt!) * 1);
      }

      return list;
    });
    return storyStream;
  }

  @override
  bool hasLocalStory(String storyId) {
    return dbAdapterRepo.storyDbAdapter.getStoryEntity(storyId) != null;
  }

  @override
  Future<bool> deleteStoryById(StoryDeleteByIdRequest params) async {
    bool data = false;
    if (!params.storyId!.startsWith("LOCAL_")) {
      try{
        await storyApiInterface.deleteStoryById(params);
        data = true;
      }catch(e){
        data = false;
      }
    }
    dbAdapterRepo.storyDbAdapter.deleteStoryEntity(params.storyId!);
    return data;
  }

  @override
  Future<AmityStory?> fetchAndSave(String objectId) async {
    var story = await getStoryById(objectId);
    if (story != null) {
      return story;
    } else {
      return Future.value(null);
    }
  }

  @override
  ModelMapper<StoryHiveEntity, AmityStory> mapper() {
    return StoryModalMapper();
  }

  @override
  StreamController<StoryHiveEntity> observeFromCache(String objectId) {
    final streamController = StreamController<StoryHiveEntity>();
    dbAdapterRepo.storyDbAdapter.listenPostEntity(objectId).listen((event) {
      streamController.add(event);
    });
    return streamController;
  }

  @override
  Future<StoryHiveEntity?> queryFromCache(String objectId) async {
    return dbAdapterRepo.storyDbAdapter.getStoryEntity(objectId);
  }

  @override
  Future<AmityStory> getStoryById(String storyId) async {
    final data = await storyApiInterface.getStoryById(storyId);
    final amityStory = await data.saveToDb<AmityStory>(dbAdapterRepo);
    return amityStory[0];
  }

  @override
  int getFailedStoriesCount(AmityStoryTargetType targetType, String targetId) {
    return dbAdapterRepo.storyDbAdapter.getStoryCount(
        targetType.value, targetId, [AmityStorySyncState.FAILED]);
  }

  @override
  DateTime? getHighestStoryExpiresAt(
      AmityStoryTargetType targetType, String targetId) {
    return dbAdapterRepo.storyDbAdapter.getHighestStoryExpiresAt(
        targetType.value,
        targetId,
        [AmityStorySyncState.SYNCING, AmityStorySyncState.FAILED]);
  }

  @override
  DateTime? getHighestSyncedStoryExpiresAt(
      AmityStoryTargetType targetType, String targetId) {
    return dbAdapterRepo.storyDbAdapter.getHighestStoryExpiresAt(
        targetType.value, targetId, [AmityStorySyncState.SYNCED]);
  }

  @override
  int getSyncingStoriesCount(AmityStoryTargetType targetType, String targetId) {
    return dbAdapterRepo.storyDbAdapter.getStoryCount(targetType.value,
        targetId, [AmityStorySyncState.SYNCING, AmityStorySyncState.UPLOADING]);
  }
  
  @override
  List<AmityStory> getFailedStories(String targetType, String targetId) {
    List<AmityStory> stories = [];
    var entites = dbAdapterRepo.storyDbAdapter.getStoriesBySyncStates(targetType, targetId, [AmityStorySyncState.FAILED]);
    for (var entity in entites) {
      stories.add(entity.convertToAmityStory());
    }
    return stories;
  }
}
