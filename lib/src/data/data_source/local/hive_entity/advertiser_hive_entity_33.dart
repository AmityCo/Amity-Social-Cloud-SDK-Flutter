import 'package:hive/hive.dart';

part 'advertiser_hive_entity_33.g.dart';

@HiveType(typeId: 33)
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
