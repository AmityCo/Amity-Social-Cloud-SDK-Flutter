import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityCommunityLiveCollection {
  /* begin_sample_code
    gist_id: 073aa50cf96d17d1afa7c59c303d8bff
    filename: AmityCommunityLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter community live collection example
    */
  late CommunityLiveCollection communityLiveCollection;
  List<AmityCommunity> amityCommunities = [];
  final scrollcontroller = ScrollController();

  void observeCommunities(String userId) {
    //initialize community live collection
    communityLiveCollection = AmitySocialClient.newCommunityRepository()
        .getCommunities()
        .withKeyword("keyword")
        .sortBy(AmityCommunitySortOption.LAST_CREATED)
        .filter(AmityCommunityFilter.MEMBER)
        .tags([])
        .includeDeleted(true)        
        .getLiveCollection(pageSize: 20);

    //listen to data changes from live collection
    communityLiveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      // setState(() {
      amityCommunities = event;
      // });
    });

    //load first page when initiating widget
    communityLiveCollection.loadNext();

    //add pagination listener when srolling to top/bottom
    scrollcontroller.addListener(paginationListener);
  }

  void paginationListener() {
    //check if
    //#1 scrolling reached top/bottom
    //#2 live collection has next page to load more
    if ((scrollcontroller.position.pixels ==
            (scrollcontroller.position.maxScrollExtent)) &&
        communityLiveCollection.hasNextPage()) {
      communityLiveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
