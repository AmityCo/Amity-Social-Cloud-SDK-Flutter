import 'package:amity_sdk/amity_sdk.dart';

class AmityGetStortTargets {
  /* begin_sample_code
    gist_id: 660d67c04df2a25015a0e876b82322d3
    filename: AmityGetStortTargets.dart
    asc_page: https://docs.amity.co/social/flutter
    description: Flutter get story targets
    */

  late StoryTargetLiveCollection storyTargetLiveCollection;
  List<AmityStoryTarget> amityStoryTargets = [];

  void observeTargets() {
    StoryTargetSearchInfo targetOne= StoryTargetSearchInfo(targetType: AmityStoryTargetType.COMMUNITY, targetId: 'communityOne');
    StoryTargetSearchInfo targetTwo= StoryTargetSearchInfo(targetType: AmityStoryTargetType.COMMUNITY, targetId: 'communityTwo');

    storyTargetLiveCollection = StoryTargetLiveCollection(
        request: () => AmitySocialClient.newStoryRepository()
            .getStoryTargets(targets: [targetOne, targetTwo]));

    storyTargetLiveCollection.getStreamController().stream.listen((event) {
      // update latest results here
      // setState(() {
      amityStoryTargets = event;
      // });
    });

    storyTargetLiveCollection.getData();
  }
  /* end_sample_code */
}
