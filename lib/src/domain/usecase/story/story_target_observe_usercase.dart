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
}
