import 'package:amity_sdk/amity_sdk.dart';

class AmityStorySoftDelete {
  /* begin_sample_code
    gist_id: 42653ad7cfc6402a87a90550b222fa51
    filename: AmityStorySoftDelete.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter Amity Story Soft Delete
    */

  void storySoftDelete(String storyId) {
    AmitySocialClient.newStoryRepository().softDeleteStory(storyId: storyId).then((value) {
      // Handle success
    }).onError((error, stackTrace) {
      // Handle Error 
    });
  }

  /* end_sample_code */
}