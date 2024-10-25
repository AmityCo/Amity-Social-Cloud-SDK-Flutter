import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_hive_entity_32.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_settings_hive_entity_34.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';

abstract class AdDbAdapter {
  Future deleteAllAds();
  Future saveAd(AdHiveEntity adHiveEntity);
  Future saveAdvertiser(AdvertiserHiveEntity advertiserHiveEntity);
  Future saveAdsSettings(AdSettingsHiveEntity settings);
  List<AdHiveEntity>? getAllAds();
  AdvertiserHiveEntity? getAdvertiser(String advertiserId);
  AdSettingsHiveEntity? getSettings();
}
