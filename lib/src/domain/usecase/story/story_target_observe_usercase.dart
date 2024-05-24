import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_target_composer_usecase.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class StoryTargetObserveUsecase extends UseCase<List<AmityStoryTarget>,
    RequestBuilder<GetTargetsByTargetsRequest>> {
  final StoryTargetRepo storyTargetRepo;
  final StoryTargetComposerUseCase storyTargetComposerUseCase;

  StoryTargetObserveUsecase(
      {required this.storyTargetRepo,
      required this.storyTargetComposerUseCase});

  @override
  Future<List<AmityStoryTarget>> get(
      RequestBuilder<GetTargetsByTargetsRequest> params) {
    throw UnimplementedError();
  }

  StreamController<List<AmityStoryTarget>> listen(
      RequestBuilder<GetTargetsByTargetsRequest> request) {
    final streamController = StreamController<List<AmityStoryTarget>>();
    storyTargetRepo.listenStoryTargets(request).listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await storyTargetComposerUseCase.get(element);
      });
      streamController.add(event);
    });
    return streamController;
  }

  StreamController<List<AmityStoryTarget>> listenAll(
      bool isSmartOption, AmityGlobalStoryTargetsQueryOption queryOption) {
    final streamController = StreamController<List<AmityStoryTarget>>();
    storyTargetRepo.listenAllStoryTargets().listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await storyTargetComposerUseCase.get(element);
      });
      var params = queryOption;
      if (!isSmartOption) {
        if (params.value != AmityGlobalStoryTargetsQueryOption.ALL.value) {
          if (params.value == AmityGlobalStoryTargetsQueryOption.UNSEEN.value) {
            event =
                event.where((element) => element.hasUnseen == true).toList();
          }
          if (params.value == AmityGlobalStoryTargetsQueryOption.SEEN.value) {
            event =event.where((element) => element.hasUnseen == false).toList();
          }
           event.sort(
                (a, b) => a.localSortingDate!.compareTo(b.localSortingDate??DateTime.now())* -1);
        } else {
          event.sort(
              (a, b) => a.localSortingDate!.compareTo(b.localSortingDate!) * -1);
          event = getFailedUnSeenStoryTragetsAndAddToStart(event);
        }
      } else {
        event = filterByStatus(event);
        event = getFailedUnSeenStoryTragetsAndAddToStart(event);
      }
      streamController.add(event);
    });
    return streamController;
  }

  List<AmityStoryTarget> filterByStatus(List<AmityStoryTarget> storyTargets) {
    List<AmityStoryTarget> filteredList = [];
    List<AmityStoryTarget> seen = [];
    List<AmityStoryTarget> unSeen = [];
    for (var element in storyTargets) {
      if (element.hasUnseen == true) {
        unSeen.add(element);
      } else {
        seen.add(element);
      }
    }
    unSeen.sort((a, b) => a.localSortingDate!.compareTo(b.localSortingDate!) * -1);
    seen.sort((a, b) => a.localSortingDate!.compareTo(b.localSortingDate!)* -1);
    filteredList.addAll(unSeen);
    filteredList.addAll(seen);
    return filteredList;
  }

  List<AmityStoryTarget> getFailedUnSeenStoryTragetsAndAddToStart(
      List<AmityStoryTarget> storyTargets) {
    List<AmityStoryTarget> unSeenFailedStories = [];
    for (var element in storyTargets) {
      if (element.failedStoriesCount != 0 && element.hasUnseen == true) {
        unSeenFailedStories.add(element);
      }
    }
    if (unSeenFailedStories.isNotEmpty) {
      storyTargets
          .removeWhere((element) => unSeenFailedStories.contains(element));
      storyTargets.insertAll(0, unSeenFailedStories);
    } 
    return storyTargets;
  }
}
