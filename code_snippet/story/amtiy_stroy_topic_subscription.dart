import 'package:amity_sdk/amity_sdk.dart';

class AmityStoryTopicSubscription {
  /* begin_sample_code
    gist_id: d01e55679e9170983ee0a33b68c65b47
    filename: AmityStoryTopicSubscription.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter subscribe to stroy topic example
    */

  void subscribeToStoryTopic(AmityStory story) {
    story
        .subscription()
        .subscribeTopic()
        .then((value) {
          // Event Subscription successfull 
        })
        .onError((error, stackTrace) {
      // Handle error
    });
  }

  /* end_sample_code */
}
