import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'community_feed_hive_13.g.dart';

@HiveType(typeId: AmityHiveType.communityFeed)
class CommunityFeedHiveEntity extends HiveObject {
  @HiveField(0)
  String? feedId;

  @HiveField(1)
  String? feedType;

  @HiveField(2)
  String? targetId;

  @HiveField(3)
  String? targetType;

  @HiveField(4)
  int? postCount;

  CommunityFeedHiveEntity({
    this.feedId,
    this.feedType,
    this.targetId,
    this.targetType,
    this.postCount,
  });
}
