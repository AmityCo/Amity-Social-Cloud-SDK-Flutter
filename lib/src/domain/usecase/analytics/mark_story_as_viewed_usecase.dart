import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/engine/analytics/analytics_service.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_target_composer_usecase.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class MarkStoryAsViewedUseCase extends UseCase<void, AmityStory> {
  AnalyticsService analyticsService = AnalyticsService();
  final StoryTargetRepo storyTargetRepo;
  final StoryTargetComposerUseCase storyTargetComposerUseCase;
  MarkStoryAsViewedUseCase(
      {required this.storyTargetRepo,
      required this.storyTargetComposerUseCase});

  @override
  Future<void> get(AmityStory params) async {
    if (params.storyId == null) throw Exception("Story ID is required");
    if (params.syncState != AmityStorySyncState.SYNCED) {
      return Future(() => null);
    }
    analyticsService.markStoryAsViewed(params.storyId!);
    var storyTarget = storyTargetRepo.getStoryTargetLocal(
        params.targetType!, params.targetId!);
    if (storyTarget != null) {
      storyTarget = await storyTargetComposerUseCase.get(storyTarget);
      if (params.expiresAt != null) {
        if (params.expiresAt!
            .isAfter((storyTarget.highestSeen ?? DateTime.now()))) {
          storyTargetRepo.updateStoryTargetLocalLastStorySeenExpiresAt(
              params.targetType!, params.targetId!, params.expiresAt);
        }
      }
    }

    return Future.value();
  }
}
