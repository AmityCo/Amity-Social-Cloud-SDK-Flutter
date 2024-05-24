import 'package:amity_sdk/amity_sdk.dart';

class AmityMarkStoryAsSeen {
  /* begin_sample_code
    gist_id: 1f8bb19e717338fc71520f32e74e602c
    filename: AmityMarkStoryAsSeen.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter mark Story as Seen example
    */
  void markStoryAsSeen(AmityStory story) {
    // To mark stroy as seen
    story.analytics().markAsSeen();
    // To get Impressions
    story.impression;
    // To get Reach
    story.reach;
  }
  /* end_sample_code */
}