import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/ad_api_interface.dart';
import 'package:amity_sdk/src/data/response/network_ads_response.dart';
import 'package:dio/dio.dart';

class AdApiInterfaceImpl extends AdApiInterface {
  /// Public HTTP client
  final HttpApiClient httpApiClient;

  /// Init [AdApiInterfaceImpl]
  AdApiInterfaceImpl({required this.httpApiClient});

  @override
  Future<NetworkAdsResponse> getNetworkAds() async {
    try {
      final response = await httpApiClient().get(NETWORK_ADS);
      return NetworkAdsResponse.fromJson(response.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }
}
