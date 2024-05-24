import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryTargetComposerUseCase
    extends UseCase<AmityStoryTarget, AmityStoryTarget> {
  final StoryRepo storyRepo;
  final StoryTargetRepo storyTargetRepo;

  /// Community Repo
  final CommunityRepo communityRepo;

  /// Community Composer Usecase
  final CommunityComposerUsecase communityComposerUsecase;
  StoryTargetComposerUseCase(
      {required this.storyRepo,
      required this.storyTargetRepo,
      required this.communityComposerUsecase,
      required this.communityRepo});

  @override
  Future<AmityStoryTarget> get(AmityStoryTarget params) async {
    addSyncingCount(params);
    addFailedCount(params);
    addTarget(params);
    addHighestSeen(params);
    addHasUnseen(params);
    return params;
  }

  void addSyncingCount(AmityStoryTarget storyTarget) {
    storyTarget.syncingStoriesCount = storyRepo.getSyncingStoriesCount(
        storyTarget.targetType, storyTarget.targetId);
  }

  void addFailedCount(AmityStoryTarget storyTarget) {
    storyTarget.failedStoriesCount = storyRepo.getFailedStoriesCount(
        storyTarget.targetType, storyTarget.targetId);
  }

  Future addTarget(AmityStoryTarget storyTarget) async {
    if (storyTarget is AmityStoryTargetCommunity) {
      storyTarget.community =
          await communityRepo.getCommunityById(storyTarget.targetId);
      if (storyTarget.community != null) {
        storyTarget.community =
            await communityComposerUsecase.get(storyTarget.community!);
      }
    }
  }

  void addHighestSeen(AmityStoryTarget storyTarget) {
    storyTarget.highestSeen = getHighestSeen(storyTarget);
  }

  DateTime? getHighestSeen(AmityStoryTarget storyTarget) {
    if (storyTarget.localLastStorySeenExpiresAt == null &&
        storyTarget.lastStorySeenExpiresAt == null) {
      return null;
    } else if (storyTarget.localLastStorySeenExpiresAt == null) {
      return storyTarget.lastStorySeenExpiresAt;
    } else if (storyTarget.lastStorySeenExpiresAt == null) {
      return storyTarget.localLastStorySeenExpiresAt;
    } else {
      if (storyTarget.localLastStorySeenExpiresAt!
          .isAfter(storyTarget.lastStorySeenExpiresAt!)) {
        return storyTarget.localLastStorySeenExpiresAt!;
      } else {
        return storyTarget.lastStorySeenExpiresAt;
      }
    }
  }

  Future addHasUnseen(AmityStoryTarget storyTarget) async {
    var now = DateTime.now();
    bool computedHasUnseen;
    DateTime? localSortingDate;

    if (storyTarget.syncingStoriesCount + storyTarget.failedStoriesCount > 0) {
      computedHasUnseen =
          (storyTarget.localLastStoryExpiresAt?.isAfter(now) ?? false) &&
              (storyTarget.localLastStoryExpiresAt!
                      .isAfter(getHighestSeen(storyTarget) ?? now)
                  ? true
                  : false);
      localSortingDate = storyTarget.localLastStoryExpiresAt;
    } else {
      computedHasUnseen =
          (storyTarget.lastStoryExpiresAt?.isAfter(now) ?? false) &&
              (storyTarget.lastStoryExpiresAt
                      ?.isAfter(getHighestSeen(storyTarget) ?? now) ??
                  false);
      localSortingDate = storyTarget.lastStoryExpiresAt;
    }

    if (storyTarget.hasUnseen != computedHasUnseen ||
        storyTarget.localSortingDate != localSortingDate) {
      storyTarget.hasUnseen = computedHasUnseen;
      storyTarget.localSortingDate = localSortingDate;

      // print("Updating story target: ${storyTarget.targetId} with hasUnseen: $computedHasUnseen and localSortingDate: $localSortingDate");

       updateStoryTarget(storyTarget, computedHasUnseen, localSortingDate);
    }
  }

  Future updateStoryTarget(AmityStoryTarget storyTarget, bool hasUnseen,
      DateTime? localSortingDate) async {
        // storyTargetRepo.updateStoryTargetHasUnseen(storyTarget.targetType,
        // storyTarget.targetId, hasUnseen, localSortingDate);
  }
}
