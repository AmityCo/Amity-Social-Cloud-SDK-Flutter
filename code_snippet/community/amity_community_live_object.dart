import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityCommunityGetLiveObject {
  /* begin_sample_code
    gist_id: dc06354dd7e4b58c56fe9077162eea59
    filename: AmityCommunityGetLiveObject.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter community live object Example 
    */

  void observeCommunity(String communityId) {
    StreamBuilder<AmityCommunity>(
        stream: AmitySocialClient.newCommunityRepository().live.getCommunity(communityId),
        builder: (context, snapshot) {
          // update widget
          // eg. widget.text = snapshot.data?.communityId;
          return Container();
        });
  }

  /* end_sample_code */
}
