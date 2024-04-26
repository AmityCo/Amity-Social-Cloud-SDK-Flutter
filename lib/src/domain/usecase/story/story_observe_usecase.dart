import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_composer_usercase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/usecase/story/get_failed_stories_usecase.dart';

class StoryObserveUseCase extends UseCase<List<AmityStory>,
    RequestBuilder<GetStoriesByTragetRequest>> {
  final StoryRepo storyRepo;
  final StoryComposerUseCase storyComposerUseCase;
  final GetFailedStoriesUseCase getFailedStoriesUseCase;

  StoryObserveUseCase(
      {required this.storyRepo,
      required this.storyComposerUseCase,
      required this.getFailedStoriesUseCase});

  @override
  Future<List<AmityStory>> get(
      RequestBuilder<GetStoriesByTragetRequest> params) {
    // TODO: implement get
    throw UnimplementedError();
  }

  StreamController<List<AmityStory>> listen(
      RequestBuilder<GetStoriesByTragetRequest> request) {
    final streamController = StreamController<List<AmityStory>>();
    storyRepo.listenStories(request).listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await storyComposerUseCase.get(element);
      });
      streamController.add(event);
    });
    
     getFailedStoriesUseCase.get(request()).then((value) {
      streamController.add(value);
    });
    

    return streamController;
  }
}
