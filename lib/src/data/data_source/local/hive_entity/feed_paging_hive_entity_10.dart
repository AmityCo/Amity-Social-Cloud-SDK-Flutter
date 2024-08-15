import 'package:hive/hive.dart';

part 'feed_paging_hive_entity_10.g.dart';

@HiveType(typeId: 10)
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
