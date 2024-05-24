import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityGetStorytReachedUsers {
  /* begin_sample_code
    gist_id: 7f0e1a8c17d069e94cace47e57efbf10
    filename: AmityGetStorytReachedUsers.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter get reached users for story example
    */
  final _amityUsers = <AmityUser>[];
  late PagingController<AmityUser> _amityUsersController;
  final scrollcontroller = ScrollController();

  void getPostReachedUsers(String storyId) {
    _amityUsersController = PagingController(
      pageFuture: (token) => AmityCoreClient.newUserRepository()
          .getViewedUsers(viewedId: storyId, viewedType: AmityViewedType.STORY)
          .getPagingData(token: token, limit: 10),
      pageSize: 20,
    )..addListener(
        () {
          if (_amityUsersController.error == null) {
            //handle _amityUsersController, we suggest to clear the previous items
            //and add with the latest _controller.loadedItems
            _amityUsers.clear();
            _amityUsers.addAll(_amityUsersController.loadedItems);
            //update widgets
          } else {
            //error on pagination controller
            //update widgets
          }
        },
      );

    // To fetch the first page
    _amityUsersController.fetchNextPage();
    _amityUsersController.addListener(pagination);
  }

  void pagination() {
    if ((scrollcontroller.position.pixels ==
            scrollcontroller.position.maxScrollExtent) &&
        _amityUsersController.hasMoreItems) {
      _amityUsersController.fetchNextPage();
    }
  }
  /* end_sample_code */
}
