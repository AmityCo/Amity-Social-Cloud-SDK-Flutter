import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/usecase/ads/get_network_ads_ucsecase.dart';
import 'package:amity_sdk/src/public/repo/ads/amity_ad_analytics.dart';

class AmityAdRepository {
  Future<AmityNetworkAds> getNetworkAds() {
    return serviceLocator<GetNetworkAdsUseCase>().get();
  }

  AmityAdAnalytics analytics(AmityAd ad) {
    return AmityAdAnalytics(ad);
  }
}
