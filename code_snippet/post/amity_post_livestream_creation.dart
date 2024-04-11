import 'package:amity_sdk/amity_sdk.dart';

class AmityPostTextCreation {
  /* begin_sample_code
    gist_id: 4eff4747e61de1708b460e83b53786fa
    filename: AmityPostLivestreamCreation.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter create livestream post example
    */

  //current post collection from feed repository
  late PagingController<AmityPost> _controller;

  void createLivestreamPost() {

    const userId = 'userAId';
    const startMentionIndex = 0;
    const mentionLength = 6;
    //create AmityMentionMetadata from userId, startIndex and length
    final mentionMetadata = AmityUserMentionMetadata(
        userId: userId, index: startMentionIndex, length: mentionLength);
    //construct AmityMentionMetadata to JsonObject using AmityMentionMetadataCreator
    final mentionMetadataCreator =
        AmityMentionMetadataCreator([mentionMetadata]).create();

    AmitySocialClient.newPostRepository()
        .createPost()
        .targetUser(
            'userId') // or targetMe(), targetCommunity(communityId: String)
        .liveStream('streamId')
        .text('Hello from flutter!')
        .mentionUsers([userId]) // optional add mentionUser and meta data
        .metadata(mentionMetadataCreator)
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
