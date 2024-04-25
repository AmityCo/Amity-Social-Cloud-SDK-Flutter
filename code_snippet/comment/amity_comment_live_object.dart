import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityCommentGetLiveObject {
  /* begin_sample_code
    gist_id: 93a75eef4d08380e6970091c80351217
    filename: AmityCommentGetLiveObject.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter comment live object Example 
    */

  void observeComment(String commentId) {
    StreamBuilder<AmityComment>(
        stream: AmitySocialClient.newCommentRepository().live.getComment(commentId),
        builder: (context, snapshot) {
          // update widget
          // eg. widget.text = post.postId
          return Container();
        });
  }

  /* end_sample_code */
}
