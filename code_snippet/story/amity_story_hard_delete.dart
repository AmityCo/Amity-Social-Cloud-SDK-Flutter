import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityStoryHardDelete {
  /* begin_sample_code
    gist_id: 90dd6bea1cccfd1d7c643bbedd718dda
    filename: AmityStoryHardDelete.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter Amity Story hard Delete Example
    */

  void storyHardDelete(String storyId) {
    AmitySocialClient.newStoryRepository().hardDeleteStory(storyId: storyId).then((value) {
      // Handle success
    }).onError((error, stackTrace) {
      // Handle Error 
    });
  }

  /* end_sample_code */
}
