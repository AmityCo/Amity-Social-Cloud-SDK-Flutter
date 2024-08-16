import 'dart:io';

import 'package:amity_sdk/amity_sdk.dart';

class AmityCommunityPermissionCheck {
  /* begin_sample_code
    gist_id: b3d87d6158f2402de208babfadbdef3b
    filename: AmityCommunityPermissionCheck.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter check community permission example
    */
  void checkPermssion(AmityPermission permission, String communityId) {
    final hasPermission = AmityCoreClient.hasPermission(AmityPermission.EDIT_COMMUNITY)
        .atCommunity(communityId)
        .check();
  }
  /* end_sample_code */
}
