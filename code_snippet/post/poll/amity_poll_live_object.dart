import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityPollGetLiveObject {
  
  /* begin_sample_code
    gist_id: 2887c07552c1cd97ffb16aef57ba0b08
    filename: amity_poll_live_object.dart.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter poll get example
    */
  void getPollPost(AmityPost post) {
    //parent post text is always TextData
    //from this line you can get the post's text data
    //eg 'What are your favorite songs?'
    final textContent = post.data as TextData;
    final childrenPosts = post.children;
    //check if the chidren posts exist in the parent post
    if (childrenPosts?.isNotEmpty == true) {
      childrenPosts?.forEach((AmityPost childPost) {
        //check if the current child post is an poll post
        if (childPost.type == AmityDataType.POLL) {
          //if the current child post is an poll post,
          //we can cast its data to PollData
          final AmityPostData? amityPostData = childPost.data;
          if (amityPostData != null) {
            final pollData = amityPostData as PollData;
            StreamBuilder<AmityPoll>(
              stream: pollData.live.getPoll(),
              builder: (context, snapshot) {
                // update widget
                // eg. widget.text = post.postId
                return Container();
              }
            );
          }
        }
      });
    }
  }
  /* end_sample_code */
}
