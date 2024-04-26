import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/engine/analytics/analytics_service.dart';

class MarkStoryAsClickedUseCase extends UseCase<void , AmityStory>{

  AnalyticsService analyticsService = AnalyticsService();
  @override
  Future<void> get(AmityStory params) {
    if (params.syncState != AmityStorySyncState.SYNCED) {
      return Future(() => null);
    }
    analyticsService.markStoryAsClicked(params.storyId!);
    return Future.value();
  }

}