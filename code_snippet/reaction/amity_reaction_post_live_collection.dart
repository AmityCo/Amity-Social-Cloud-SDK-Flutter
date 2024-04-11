import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityPostReactionLiveCollection {
  /* begin_sample_code
    gist_id: a890aee170d81e2e524a0dcbf6633de1
    filename: AmityPostReactionLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter post reaction live collection example
    */
  late ReactionLiveCollection reactionLiveCollection;
  List<AmityReaction> amityReactions = [];
  final scrollcontroller = ScrollController();

  void observeReaction(String postId) {
    //initialize post reaction live collection
    reactionLiveCollection = AmitySocialClient.newPostRepository()
        .getReaction(postId: postId)
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
