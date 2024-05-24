import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/material.dart';

class AmityGlobalStoryTargetLiveCollection {
  /* begin_sample_code
    gist_id: 66bef07590e15ad6856f6900547f42f8
    filename: AmityGlobalStoryTargetLiveCollection.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter Global Target live collection example
    */
  late GlobalStoryTargetLiveCollection globalStoryTargetLiveCollection;
  List<AmityStoryTarget> amityStoryTarget = [];
  final scrollcontroller = ScrollController();

  void observePosts(
      {AmityGlobalStoryTargetsQueryOption selectedType =
          AmityGlobalStoryTargetsQueryOption.SMART}) {
    //initialize live collection
    globalStoryTargetLiveCollection =
        GlobalStoryTargetLiveCollection(queryOption: selectedType);
    ;

    //listen to data changes from live collection
    globalStoryTargetLiveCollection
        .getStreamController()
        .stream
        .listen((event) {
      // update latest results here
      // setState(() {
      amityStoryTarget = event;
      // });
    });

    //load first page when initiating widget
    globalStoryTargetLiveCollection.loadNext();

    //add pagination listener when srolling to top/bottom
    scrollcontroller.addListener(paginationListener);
  }

  void paginationListener() {
    //check if
    //#1 scrolling reached top/bottom
    //#2 live collection has next page to load more
    if ((scrollcontroller.position.pixels ==
            (scrollcontroller.position.maxScrollExtent)) &&
        globalStoryTargetLiveCollection.hasNextPage()) {
      globalStoryTargetLiveCollection.loadNext();
    }
  }
  /* end_sample_code */
}
