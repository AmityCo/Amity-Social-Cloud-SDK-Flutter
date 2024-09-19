import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/engine/analytics/analytics_service.dart';

class MarkAdAsClickedUseCase {
  AnalyticsService analyticsService = AnalyticsService();

  Future<void> get(AmityAd ad, AmityAdPlacement adPlacement) {
    analyticsService.markAdAsClicked(ad, adPlacement);
    return Future.value();
  }
}
