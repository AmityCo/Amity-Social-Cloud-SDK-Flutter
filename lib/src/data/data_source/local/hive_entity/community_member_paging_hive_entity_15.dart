import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'community_member_paging_hive_entity_15.g.dart';

@HiveType(typeId: AmityHiveType.communityMemberPaging)
class CommunityMemberPagingHiveEntity {
  @HiveField(0)
  String? id;

  @HiveField(1)
  List<String>? communityMemberIds;

  @HiveField(2)
  String? nextToken;

  @HiveField(3)
  String? prevToken;

  CommunityMemberPagingHiveEntity({
    this.id,
    this.communityMemberIds,
    this.nextToken,
    this.prevToken,
  });
}
