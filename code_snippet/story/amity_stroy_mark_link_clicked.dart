import 'package:amity_sdk/amity_sdk.dart';

class AmityMarkStoryLinkedClicked {
  /* begin_sample_code
    gist_id: 00153d771164368529bbeaa27741d7d6
    filename: AmityMarkStoryLinkedClicked.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter mark Story linked clicked example
    */
  void markStoryLinkClicked(AmityStory story) {
    // To mark stroy as seen
    story.analytics().markLinkAsClicked();
  }
  /* end_sample_code */
}