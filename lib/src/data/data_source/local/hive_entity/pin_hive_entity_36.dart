import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'pin_hive_entity_36.g.dart';

@HiveType(typeId: AmityHiveType.pin)
class PinHiveEntity extends EkoObject {

  @HiveField(0)
  final String pinId;
  
  @HiveField(1)
  final String referenceId;
  
  @HiveField(2)
  final String referenceType;
  
  @HiveField(3)
  final String placement;
  
  @HiveField(4)
  final String targetId;
  
  @HiveField(5)
  final String targetType;
  
  @HiveField(6)
  final String pinnedBy;
  
  @HiveField(7)
  final DateTime pinnedAt;
  
  @HiveField(8)
  final DateTime lastPinsUpdatedAt;

  PinHiveEntity({
    required this.pinId,
    required this.referenceId,
    required this.referenceType,
    required this.placement,
    required this.targetId,
    required this.targetType,
    required this.pinnedBy,
    required this.pinnedAt,
    required this.lastPinsUpdatedAt,
  });
  
  @override
  String? getId() {
    return pinId;
  }

  bool isMatchingFilter(QueryPinnedPostRequest request) {
    return isMatchingTargetId(request.targetId) 
    && isMatchingTargetType(request.targetType)
    && isMatchingPlacement(request.placement);
  }

  bool isMatchingTargetId(String targetId) {
    return targetId == this.targetId;
  }

  bool isMatchingTargetType(String targetType) {
    return targetType == this.targetType  ;
  }

  bool isMatchingPlacement(String? placement) {
    return placement == this.placement;
  }

}