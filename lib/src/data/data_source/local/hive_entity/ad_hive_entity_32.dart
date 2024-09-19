import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'ad_hive_entity_32.g.dart';

@HiveType(typeId: 32)
class AdHiveEntity extends EkoObject {
  String? adId;
  String? advertiserId;
  String? name;
  List<String>? placements;
  String? headline;
  String? description;
  String? body;
  Map<String, dynamic>? target;
  String? callToAction;
  String? callToActionUrl;
  String? image1_1;
  String? image9_16;
  DateTime? startAt;
  DateTime? endAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  String? getId() {
    return adId;
  }
}
