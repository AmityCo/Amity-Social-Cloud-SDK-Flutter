import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityChannelQuery {
  /* begin_sample_code
    gist_id: 009393e93159effa667638bcb48d2884
    filename: AmityChannelQuery.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter query channels example
    */
  List<AmityChannel> _amityChannel = <AmityChannel>[];
  late ChannelLiveCollection liveCollection;
  final scrollcontroller = ScrollController();
  
  // Available Channel Type options
  // AmityChannelType.COMMUNITY;
  // AmityChannelType.LIVE;
  // AmityChannelType.BROADCAST;
  // AmityChannelType.CONVERSATION;

  void queryChannels() {
    // Query for Community type
    liveCollection = AmityChatClient.newChannelRepository()
          .getChannels()
          .communityType()
          .getLiveCollection();

    // Query for Live type
    liveCollection = AmityChatClient.newChannelRepository()
          .getChannels()
          .liveType()
          .getLiveCollection();

    // Query for Broadcast type
    liveCollection = AmityChatClient.newChannelRepository()
          .getChannels()
          .broadcastType()
          .getLiveCollection();

    // Query for Conversation type
    liveCollection = AmityChatClient.newChannelRepository()
          .getChannels()
          .conversationType()
          .getLiveCollection();

     // Query for Multiple types
    final types = <AmityChannelType>[
      AmityChannelType.LIVE,
      AmityChannelType.COMMUNITY
    ];
    liveCollection = AmityChatClient.newChannelRepository()
          .getChannels()
          .types(types)
          .getLiveCollection();

    //listen to data changes from live collection
    liveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      _amityChannel = event;
    }, onError: (error) {
      //handle error
    });

    //load first page when initiating widget
    liveCollection.loadNext();

    //add pagination listener when srolling to top/bottom
    scrollcontroller.addListener(paginationListener);
  }

  void paginationListener() {
    //check if
    //#1 scrolling reached top/bottom
    //#2 live collection has next page to load more
    if (
      scrollcontroller.position.pixels == scrollcontroller.position.maxScrollExtent
        && liveCollection.hasNextPage()
    ) {
      liveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
