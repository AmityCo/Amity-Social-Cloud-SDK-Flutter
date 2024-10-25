import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/click_ad_event_capturer.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/click_story_event_capturer.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/view_ad_event_capturer.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/view_post_event_capturer.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/view_story_event_capturer.dart';

class AnalyticsService {
  void markPostAsViewed(String postId) {
    AmityCoreClient.getAnalyticsEngine()
        ?.getCapturerInstance<ViewPostEventCapturer>()
        ?.captureEvent(postId);
  }

  void markStoryAsViewed(String storyId) {
    AmityCoreClient.getAnalyticsEngine()
        ?.getCapturerInstance<ViewStoryEventCapturer>()
        ?.captureEvent(storyId);
  }

  void markStoryAsClicked(String storyId) {
    AmityCoreClient.getAnalyticsEngine()
        ?.getCapturerInstance<ClickStoryEventCapturer>()
        ?.captureEvent(storyId);
  }

  void markAdAsClicked(AmityAd ad, AmityAdPlacement adPlacement) {
    Map<String, dynamic> metadata = <String, dynamic>{};
    metadata['placement'] = adPlacement.value;
    if (ad.adId != null) {
      AmityCoreClient.getAnalyticsEngine()
          ?.getCapturerInstance<ClickAdEventCapturer>()
          ?.captureEvent(ad.adId!);
    }
  }

  void markAdAsViewed(AmityAd ad, AmityAdPlacement adPlacement) {
    Map<String, dynamic> metadata = <String, dynamic>{};
    metadata['placement'] = adPlacement.value;
    if (ad.adId != null) {
      AmityCoreClient.getAnalyticsEngine()
          ?.getCapturerInstance<ViewAdEventCapturer>()
          ?.captureEvent(ad.adId!);
    }
  }
}
