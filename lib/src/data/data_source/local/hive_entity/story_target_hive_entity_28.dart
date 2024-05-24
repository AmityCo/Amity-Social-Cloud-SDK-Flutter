import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'story_target_hive_entity_28.g.dart';

@HiveType(typeId: 28)
class StoryTargetHiveEntity  extends EkoObject {

  String? uniqueId;

  String? targetId;

  String? targetPublicId;

  String? targetType = AmityStoryTargetType.UNKNOWN.value;

  DateTime? lastStoryExpiresAt;

  DateTime? lastStorySeenExpiresAt;

  DateTime? targetUpdatedAt;

  

  // Local Feild

  bool? hasUnseen = false;

  DateTime? localSortingDate;

  DateTime? localLastStoryExpiresAt;

  DateTime? localLastStorySeenExpiresAt;


  StoryTargetHiveEntity({
    this.uniqueId,
    this.targetId,
    this.targetType,
    this.targetPublicId,
    this.lastStoryExpiresAt,
    this.lastStorySeenExpiresAt,
    this.targetUpdatedAt,
    this.hasUnseen = false,
    this.localSortingDate,
    this.localLastStoryExpiresAt,
    this.localLastStorySeenExpiresAt
  });


  StoryTargetHiveEntity copyWith({
    String? uniqueId,
    String? targetId,
    String? targetType,
    DateTime? lastStoryExpiresAt,
    DateTime? lastStorySeenExpiresAt,
    DateTime? targetUpdatedAt,
    bool? hasUnseen,
    String? targetPublicId,
    DateTime? localSortingDate,
    DateTime? localLastStoryExpiresAt,
    DateTime? localLastStorySeenExpiresAt
  }){
    return StoryTargetHiveEntity(
      uniqueId: uniqueId ?? this.uniqueId,
      targetId: targetId ?? this.targetId,
      targetPublicId: targetPublicId ?? this.targetPublicId,
      targetType: targetType ?? this.targetType,
      lastStoryExpiresAt: lastStoryExpiresAt ?? this.lastStoryExpiresAt,
      lastStorySeenExpiresAt: lastStorySeenExpiresAt ?? this.lastStorySeenExpiresAt,
      targetUpdatedAt: targetUpdatedAt ?? this.targetUpdatedAt,
      hasUnseen: hasUnseen ?? this.hasUnseen,
      localSortingDate: localSortingDate ?? this.localSortingDate,
      localLastStoryExpiresAt: localLastStoryExpiresAt ?? this.localLastStoryExpiresAt,
      localLastStorySeenExpiresAt: localLastStorySeenExpiresAt ?? this.localLastStorySeenExpiresAt
    );

  }


  @override
  String? getId() {
    return "$targetType/$targetId";
  }

}
