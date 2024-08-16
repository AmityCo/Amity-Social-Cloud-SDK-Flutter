import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityCommunityQuery {
  /* begin_sample_code
    gist_id: d22e645d88768aeb6c0ab69c9bca0525
    filename: AmityCommunityQuery.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter query communities example
    */
  List<AmityCommunity> _amityCommunities = <AmityCommunity>[];
  late CommunityLiveCollection liveCollection;
  final scrollcontroller = ScrollController();

  //Available sort options
  // AmityCommunitySortOption.DISPLAY_NAME;
  // AmityCommunitySortOption.LAST_CREATED;
  // AmityCommunitySortOption.FIRST_CREATED;

  // Available filter options
  // AmityCommunityFilter.ALL;
  // AmityCommunityFilter.MEMBER;
  // AmityCommunityFilter.NOT_MEMBER;

  void queryCommunities(
    AmityCommunitySortOption sortOption,
    AmityCommunityFilter filter
  ) {
    liveCollection = AmitySocialClient.newCommunityRepository()
      .getCommunities()
      .filter(filter)
      .sortBy(sortOption)
      .includeDeleted(true)
      .withKeyword('hello') //optional for searching communities
      .categoryId(
          'id')
      .getLiveCollection();

    //listen to data changes from live collection
    liveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      _amityCommunities = event;
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
