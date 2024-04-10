import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityMessageReactionLiveCollection {
  /* begin_sample_code
    gist_id: 8bb652ac8be17fd8ece9747ba32ab6f8
    filename: AmityMessageReactionLiveCollection.dart
    asc_page: https://docs.amity.co/chat/flutter
    description: Flutter message reaction live collection example
    */
  late ReactionLiveCollection reactionLiveCollection;
  List<AmityReaction> amityReactions = [];
  final scrollcontroller = ScrollController();

  void observeReaction(String messageId) {
    //initialize message reaction live collection
    reactionLiveCollection = AmityChatClient.newMessageRepository()
        .getReaction(messageId: messageId)
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
