import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';


part 'tombstone_hive_entity_23.g.dart';

@HiveType(typeId: AmityHiveType.tombstone)
class TombstoneHiveEntity extends EkoObject  {

  String? objectId = null;
  int? errorCode = null;
  String? modelType = null;

  TombstoneHiveEntity({this.errorCode , this.modelType , this.objectId});

  @override
  String? getId() {
    return "$objectId$modelType";
  }
}
