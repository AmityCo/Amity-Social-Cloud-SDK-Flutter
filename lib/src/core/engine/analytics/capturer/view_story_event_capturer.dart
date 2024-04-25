import 'package:amity_sdk/src/core/engine/analytics/analytics_event_sync_priority.dart';
import 'package:amity_sdk/src/core/engine/analytics/capturer/analytics_event_capturer.dart';

class ViewStoryEventCapturer extends AnalyticsEventCapturer {
  ViewStoryEventCapturer()
      : super(
            contentType: "story",
            eventType: "view",
            syncPriority: AnalyticsEventSyncPriority.HIGH);
}
