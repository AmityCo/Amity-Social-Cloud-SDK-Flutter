import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_settings_hive_entity_34.dart';
import 'package:amity_sdk/src/data/response/ads_settings_response.dart';

extension AdsSettingsResponseExtension on AdsSettingsResponse {
  AdSettingsHiveEntity toHiveEntity() {
    return AdSettingsHiveEntity()
      ..enabled = isEnabled
      ..maxActiveAds = maxActiveAds
      ..frequency = frequency;
  }
}
