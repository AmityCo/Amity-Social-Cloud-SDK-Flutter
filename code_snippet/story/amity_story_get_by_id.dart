import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityStoryGetLiveObject {
  /* begin_sample_code
    gist_id: 4b8f5415668403e9d8a6b75d1e1431fd
    filename: AmityGetStoryByID.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter Amity Story live Object by ID Example
    */

  void observeStory(String storyId) {
    StreamBuilder<AmityStory>(
        stream: AmitySocialClient.newStoryRepository().live.getStory(storyId),
        builder: (context, snapshot) {
          // update widget
          // eg. widget.text = story.storyId
          return Container();
        });
  }

  /* end_sample_code */
}
