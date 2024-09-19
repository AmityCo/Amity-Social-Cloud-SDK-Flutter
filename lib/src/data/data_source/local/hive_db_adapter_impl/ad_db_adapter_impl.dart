import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_hive_entity_32.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_settings_hive_entity_34.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';
import 'package:hive/hive.dart';

import '../db_adapter/ad_db_adapter.dart';

class AdDbAdapterImpl implements AdDbAdapter {
  /// Db Client
  final DBClient dbClient;

  /// Ad Box
  late Box<AdHiveEntity> adBox;

  /// Advertiser Box
  late Box<AdvertiserHiveEntity> advertiserBox;

  /// Ad Settings Box
  late Box<AdSettingsHiveEntity> adSettingsBox;

  /// init [AdDbAdapterImpl]
  AdDbAdapterImpl({required this.dbClient});

  /// Init [AdDbAdapterImpl]
  Future<AdDbAdapterImpl> init() async {
    Hive.registerAdapter(AdHiveEntityAdapter(), override: true);
    Hive.registerAdapter(AdvertiserHiveEntityAdapter(), override: true);
    Hive.registerAdapter(AdSettingsHiveEntityAdapter(), override: true);

    adBox = await Hive.openBox<AdHiveEntity>('ad_db');
    advertiserBox = await Hive.openBox<AdvertiserHiveEntity>('advertiser_db');
    adSettingsBox = await Hive.openBox<AdSettingsHiveEntity>('ad_settings_db');

    return this;
  }

  @override
  Future deleteAllAds() async {
    adBox.clear();
  }

  @override
  Future saveAd(AdHiveEntity adHiveEntity) async {
    adBox.put(adHiveEntity.getId(), adHiveEntity);
  }

  @override
  Future saveAdvertiser(AdvertiserHiveEntity advertiserHiveEntity) async {
    advertiserBox.put(advertiserHiveEntity.getId(), advertiserHiveEntity);
  }

  @override
  Future saveAdsSettings(AdSettingsHiveEntity settings) async {
    adSettingsBox.put(settings.getId(), settings);
  }

  @override
  List<AdHiveEntity>? getAllAds() {
    return adBox.values.toList();
  }

  @override
  AdvertiserHiveEntity? getAdvertiser(String advertiserId) {
    return advertiserBox.get(advertiserId);
  }

  @override
  AdSettingsHiveEntity? getSettings() {
    return adSettingsBox.get(AdSettingsHiveEntity.settingId);
  }
}
