import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_network_ads.dart';

abstract class AdRepository {
  Future<AmityNetworkAds> getNetworkAds();
  AmityAdvertiser? getAdvertiser(String advertiserId);
  Future<AmityNetworkAds> getLocalNetworkAds();
}
