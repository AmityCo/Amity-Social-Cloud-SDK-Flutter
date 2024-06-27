import 'package:amity_sdk/amity_sdk.dart';

class AmityPostCustomCreation {
  /* begin_sample_code
    gist_id: 39fa10767faec05a50a92123d0282686
    filename: AmityPostCustomCreation.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter create custom post example
    */

  //current post collection from feed repository
  late PagingController<AmityPost> _controller;

  void createTextPost() {
    AmitySocialClient.newPostRepository()
        .createPost()
        .targetUser(
            'userId') // or targetMe(), targetCommunity(communityId: String)
        .custom('amity.custom', {'this_is': 'my_json'}) // the customDataType pattern should always be "*.*"        
        .post()
        .then((AmityPost post) => {
              //handle result
              //optional: to present the created post in to the current post collection
              //you will need manually put the newly created post in to the collection
              //for example :
              _controller.add(post)
            })
        .onError((error, stackTrace) => {
              //handle error
            });
  }
  /* end_sample_code */
}
