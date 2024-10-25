import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/analytics/mark_ad_as_viewed_usecase.dart';

class AmityAdAnalytics {
  final AmityAd ad;

  AmityAdAnalytics(this.ad);

  Future<void> markAsSeen(AmityAdPlacement adPlacement) async {
    await MarkAdAsViewedUseCase().get(ad, adPlacement);
  }

  Future<void> markLinkAsClicked(AmityAdPlacement adPlacement) async {
    await MarkAdAsViewedUseCase().get(ad, adPlacement);
  }
}
