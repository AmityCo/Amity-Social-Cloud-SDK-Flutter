import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/engine/analytics/analytics_service.dart';

class MarkAdAsViewedUseCase {
  AnalyticsService analyticsService = AnalyticsService();

  Future<void> get(AmityAd ad, AmityAdPlacement adPlacement) {
    analyticsService.markAdAsViewed(ad, adPlacement);
    return Future.value();
  }
}
