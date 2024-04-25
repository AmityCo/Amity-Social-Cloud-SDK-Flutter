import 'package:amity_sdk/amity_sdk.dart';
import 'package:flutter/widgets.dart';

class AmityStoryTargetGetLiveObject {
  /* begin_sample_code
    gist_id: 45b5321aea68017f3d3b707cd4e4ba90
    filename: AmityGetStorytarget.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter Amity Story Target live Object  Example
    */

  void observeTarget(AmityStoryTargetType targetType , String targetId) {
    StreamBuilder<AmityStoryTarget>(
        stream: AmitySocialClient.newStoryRepository().live.getStoryTaregt(targetType: targetType, targetId: targetId),
        builder: (context, snapshot) {
          // update widget
          // eg. widget.text = storyTarget.uniqueId
          return Container();
        });
  }

  /* end_sample_code */
}