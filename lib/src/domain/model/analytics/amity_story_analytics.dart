import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/domain/usecase/analytics/mark_story_as_clicked_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/analytics/mark_story_as_viewed_usecase.dart';

class AmityStoryAnalytics{
  AmityStory story;
  AmityStoryAnalytics(this.story);

  void markAsSeen() {
    MarkStoryAsViewedUseCase(storyTargetComposerUseCase: serviceLocator() , storyTargetRepo: serviceLocator() ).get(story);
  }

  void markLinkAsClicked() {
    MarkStoryAsClickedUseCase().get(story);
  }

}