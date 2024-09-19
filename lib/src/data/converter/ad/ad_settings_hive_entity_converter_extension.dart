import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_settings_hive_entity_34.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_ads_settings.dart';

extension AdsSettingsHiveEntityExtension on AdSettingsHiveEntity {
  AmityAdsSettings convertToAmityAdsSettings() {
    return AmityAdsSettings(
      isEnabled: enabled,
      maxActiveAds: maxActiveAds,
      frequency: frequency,
      updatedAt: updatedAt,
    );
  }
}
