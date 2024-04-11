import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityCommentReactionLiveCollection {
  /* begin_sample_code
    gist_id: bc8c71d44885b1a3a83aea2f991bebe8
    filename: AmityCommentReactionLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter comment reaction live collection example
    */
  late ReactionLiveCollection reactionLiveCollection;
  List<AmityReaction> amityReactions = [];
  final scrollcontroller = ScrollController();

  void observeReaction(String commentId) {
    //initialize comment reaction live collection
    reactionLiveCollection = AmitySocialClient.newCommentRepository()
        .getReaction(commentId: commentId)
        //Optional to query specific reaction, eg. "like"
        .reactionName('like')
        .getLiveCollection(pageSize: 20);

    //listen to data changes from live collection
    reactionLiveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      // setState(() {
      amityReactions = event;
      // });
    });

    //load first page when initiating widget
    reactionLiveCollection.loadNext();

    //add pagination listener when srolling to top/bottom
    scrollcontroller.addListener(paginationListener);
  }

  void paginationListener() {
    //check if
    //#1 scrolling reached top/bottom
    //#2 live collection has next page to load more
    final _scrollPostion = scrollcontroller.position;
    if ((_scrollPostion.pixels == (_scrollPostion.maxScrollExtent)) &&
      reactionLiveCollection.hasNextPage()
    ) {
      reactionLiveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
