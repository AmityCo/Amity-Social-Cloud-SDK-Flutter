import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityCommentLiveCollection {
  /* begin_sample_code
    gist_id: f55ac00ff05c7da29f11e24dde3324db
    filename: AmityCommentLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter comment live collection example
    */
  late CommentLiveCollection commentLiveCollection;
  List<AmityComment> amityComments = [];
  final scrollcontroller = ScrollController();

  void observeComment(String postId) {
    //initialize comment live collection
    commentLiveCollection = AmitySocialClient.newCommentRepository()
        .getComments()
        .post(postId)
        .getLiveCollection(pageSize: 20);

    //listen to data changes from live collection
    commentLiveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      // setState(() {
      amityComments = event;
      // });
    });

    //load first page when initiating widget
    commentLiveCollection.loadNext();

    //add pagination listener when srolling to top/bottom
    scrollcontroller.addListener(paginationListener);
  }

  void paginationListener() {
    //check if
    //#1 scrolling reached top/bottom
    //#2 live collection has next page to load more
    final _scrollPostion = scrollcontroller.position;
    if ((_scrollPostion.pixels == (_scrollPostion.maxScrollExtent)) &&
      commentLiveCollection.hasNextPage()
    ) {
      commentLiveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
