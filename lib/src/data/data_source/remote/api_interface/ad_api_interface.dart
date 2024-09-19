import 'package:amity_sdk/src/data/response/network_ads_response.dart';

abstract class AdApiInterface {
  Future<NetworkAdsResponse> getNetworkAds();
}