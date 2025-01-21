import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'ad_settings_hive_entity_34.g.dart';

@HiveType(typeId: AmityHiveType.adSettings)
class AdSettingsHiveEntity extends HiveObject {
  static String settingId = "ADS_SETTINGS";
  bool? enabled;
  int? maxActiveAds;
  Map<String, dynamic>? frequency;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  String? getId() {
    return settingId;
  }
}
