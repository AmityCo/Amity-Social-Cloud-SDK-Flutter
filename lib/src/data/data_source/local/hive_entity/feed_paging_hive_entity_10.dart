import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'feed_paging_hive_entity_10.g.dart';

@HiveType(typeId: AmityHiveType.feedPaging)
class FeedPagingHiveEntity {
  @HiveField(0)
  String? id;

  @HiveField(1)
  List<String>? postIds;
  
  @HiveField(2)
  String? nextToken;
  
  @HiveField(3)
  String? prevToken;

  FeedPagingHiveEntity({
    this.id,
    this.postIds,
    this.nextToken,
    this.prevToken,
  });

}
