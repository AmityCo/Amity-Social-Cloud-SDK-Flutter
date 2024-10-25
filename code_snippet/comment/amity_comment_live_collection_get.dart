import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityCommentLiveCollection {
  /* begin_sample_code
    gist_id: 2532f7453b09370cf7f91e0a9f0599fa
    filename: AmityCommentLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter comment live collection example
    */
  late CommentLiveCollection commentLiveCollection;
  List<AmityComment> amityComment = [];
  final scrollcontroller = ScrollController();

  void observeComments(String postId) {
    //initialize Comment live collection
    commentLiveCollection = AmitySocialClient.newCommentRepository()
      .getComments()
      .post(postId)
      .sortBy(AmityCommentSortOption.LAST_CREATED)
      .dataTypes(
        AmityCommentDataTypeFilter.any(dataTypes: [AmityDataType.IMAGE, AmityDataType.TEXT])
      ).includeDeleted(false)
      .getLiveCollection();

    //listen to data changes from live collection
    commentLiveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      // setState(() {
      amityComment = event;
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
    if ((scrollcontroller.position.pixels == (scrollcontroller.position.maxScrollExtent)) && commentLiveCollection.hasNextPage()) {
      commentLiveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
