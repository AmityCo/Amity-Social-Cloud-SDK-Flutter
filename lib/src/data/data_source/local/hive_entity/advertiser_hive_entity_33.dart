import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'advertiser_hive_entity_33.g.dart';

@HiveType(typeId: AmityHiveType.advertiser)
class AdvertiserHiveEntity extends HiveObject {
  String? advertiserId;
  String? name;
  String? companyName;
  String? avatarFileId;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  String? getId() {
    return advertiserId;
  }
}
