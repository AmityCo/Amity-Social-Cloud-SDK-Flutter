import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/model/analytics/amity_story_analytics.dart';

extension AmityStoryExtension on AmityStory {

  AmityStoryAnalytics analytics()  {
    return AmityStoryAnalytics(this);
}

  AmityTopicSubscription subscription() {
    return AmityTopicSubscription(AmityTopic.STORY(this));
  }
}