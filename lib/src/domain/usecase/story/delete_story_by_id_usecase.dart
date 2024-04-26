import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/story_delete_by_id_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_composer_usercase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class DeleteStroyByIdUsecas extends UseCase<bool, StoryDeleteByIdRequest> {
  final StoryRepo storyRepo;
  final StoryTargetRepo storyRepoTraget;
  final StoryComposerUseCase storyComposerUseCase;

  DeleteStroyByIdUsecas(
      {required this.storyRepo,
      required this.storyComposerUseCase,
      required this.storyRepoTraget});

  @override
  Future<bool> get(StoryDeleteByIdRequest params) async {
    var cacheStory = await storyRepo.getEntity(params.storyId!);
    StoryTargetHiveEntity? cacheStoryTarget = null;
    if (cacheStory != null) {
      cacheStoryTarget = await storyRepoTraget.getEntity(
          AmityStoryTarget.generateUniqueId(
              cacheStory!.targetType!, cacheStory!.targetId!));
    }

    return storyRepo.deleteStoryById(params).then((value) {
      if (cacheStory != null) {
        if (cacheStory.storyId!.startsWith("LOCAL_")) {
          revertStoryTargetLocalLastExpires(cacheStoryTarget);
        } else {
          revertStoryTargetLastExpires(cacheStoryTarget);
        }
      }
      return value;
    });
  }

  Future revertStoryTargetLocalLastExpires(
      StoryTargetHiveEntity? storyTarget) async {
    if (storyTarget != null) {
      var highestStoryExpires = storyRepo.getHighestStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(storyTarget.targetType!),
          storyTarget.targetId!);

      if (highestStoryExpires == null) {
        return Future.value(null);
      }

      return storyRepoTraget.updateStoryTargetLocalLastStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(storyTarget.targetType!),
          storyTarget.targetId!,
          highestStoryExpires);
    } else {
      return Future.value(null);
    }
  }

  Future revertStoryTargetLastExpires(
      StoryTargetHiveEntity? storyTarget) async {
    if (storyTarget != null) {
      var highestStoryExpires = storyRepo.getHighestSyncedStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(storyTarget.targetType!),
          storyTarget.targetId!);
      if (highestStoryExpires == null) {
        return Future.value(null);
      }

      return storyRepoTraget.updateStoryTargetLastStoryExpiresAt(
          AmityStoryTargetTypeExtension.enumOf(storyTarget.targetType!),
          storyTarget.targetId!,
          highestStoryExpires);
    } else {
      return Future.value(null);
    }
  }
}
