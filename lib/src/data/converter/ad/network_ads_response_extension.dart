import 'package:amity_sdk/src/data/converter/ad/ad_response_extension.dart';
import 'package:amity_sdk/src/data/converter/ad/ads_settings_response_extension.dart';
import 'package:amity_sdk/src/data/converter/ad/advertiser_response_extension.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_hive_entity_32.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_settings_hive_entity_34.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';
import 'package:amity_sdk/src/data/response/network_ads_response.dart';

extension NetworkAdsResponseExtension on NetworkAdsResponse {
  Future<void> saveToDb(DbAdapterRepo dbRepo) async {
    // Convert to File Hive Entity
    List<FileHiveEntity> fileHiveEntities =
        files.map((e) => e.convertToFileHiveEntity()).toList();

    // Convert to Ad Hive Entity
    List<AdHiveEntity> adHiveEntities =
        ads.map((e) => e.toHiveEntity()).toList();

    // Convert to Advertiser Hive Entity
    List<AdvertiserHiveEntity> advertiserHiveEntities =
        advertisers.map((e) => e.toHiveEntity()).toList();

    // Convert to Ads Settings Hive Entity
    AdSettingsHiveEntity adsSettingsHiveEntity = settings.toHiveEntity();

    // Save the File Entity
    for (var e in fileHiveEntities) {
      await dbRepo.fileDbAdapter.saveFileEntity(e);
    }

    // Save the Ad Entity
    for (var e in adHiveEntities) {
      await dbRepo.adDbAdapter.saveAd(e);
    }

    // Save the Advertiser Entity
    for (var e in advertiserHiveEntities) {
      await dbRepo.adDbAdapter.saveAdvertiser(e);
    }

    // Save the Ads Settings Entity
    await dbRepo.adDbAdapter.saveAdsSettings(adsSettingsHiveEntity);
  }
}
