import 'package:amity_sdk/src/data/converter/ad/ad_hive_entity_converter_extension.dart';
import 'package:amity_sdk/src/data/converter/ad/ad_settings_hive_entity_converter_extension.dart';
import 'package:amity_sdk/src/data/converter/ad/advertiser_hive_entity_extension.dart.dart';
import 'package:amity_sdk/src/data/converter/ad/network_ads_response_extension.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/ad_api_interface.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_network_ads.dart';
import 'package:amity_sdk/src/domain/repo/ad_repo.dart';

class AdRepositoryImpl implements AdRepository {
  /// Channel API Interface
  final AdApiInterface adApiInterface;

  final DbAdapterRepo dbAdapterRepo;

  /// init [AdRepositoryImpl]
  AdRepositoryImpl({
    required this.adApiInterface,
    required this.dbAdapterRepo,
  });

  @override
  Future<AmityNetworkAds> getNetworkAds() async {
    try {
      final networkAdsResponse = await adApiInterface.getNetworkAds();
      await dbAdapterRepo.adDbAdapter.deleteAllAds();
      await networkAdsResponse.saveToDb(dbAdapterRepo);
      return getLocalNetworkAds();
    } catch (e) {
      return getLocalNetworkAds();
    }
  }

  @override
  AmityAdvertiser? getAdvertiser(String advertiserId) {
    final advertiserEntity =
        dbAdapterRepo.adDbAdapter.getAdvertiser(advertiserId);
    return advertiserEntity?.covertToAmityAdvertiser();
  }

  @override
  Future<AmityNetworkAds> getLocalNetworkAds() async {
    final ads = dbAdapterRepo.adDbAdapter
        .getAllAds()
        ?.map((e) => e.convertToAmityAd())
        .toList();
    final settings =
        dbAdapterRepo.adDbAdapter.getSettings()?.convertToAmityAdsSettings();
    if (settings == null) {
      throw Exception("Ads settings not available");
    }
    return AmityNetworkAds(ads, settings);
  }
}
