import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:hive/hive.dart';

part 'community_hive_entity_9.g.dart';

@HiveType(typeId: 9)
class CommunityHiveEntity extends EkoObject {
  @HiveField(0)
  String? communityId;

  @HiveField(1)
  String? path;

  @HiveField(2)
  String? channelId;

  @HiveField(3)
  String? userId;

  @HiveField(4)
  String? displayName;

  @HiveField(5)
  String? description;

  @HiveField(6)
  String? avatarFileId;

  @HiveField(7)
  bool? isOfficial;

  @HiveField(8)
  bool? isPublic = false;

  @HiveField(9)
  bool? onlyAdminCanPost = false;

  @HiveField(10)
  Map<String, dynamic>? metadata;

  @HiveField(11)
  int? postCount = 0;

  @HiveField(12)
  int? membersCount = 0;

  @HiveField(13)
  bool? isJoined = false;

  @HiveField(14)
  bool? isDeleted = false;

  @HiveField(15)
  bool? needApprovalOnPostCreation = false;

  @HiveField(16)
  DateTime? createdAt;

  @HiveField(17)
  DateTime? editedAt;

  @HiveField(18)
  List<String>? categoryIds;

  @HiveField(19)
  List<String>? tags;

  @HiveField(20)
  bool? allowCommentInStory;

  // Special timestamp for sorting displayName when query with live collection
  // Should be remove when do queryStream.
  @HiveField(21)
  DateTime? queryTimestamp;

  CommunityHiveEntity({
    this.communityId,
    this.path,
    this.channelId,
    this.userId,
    this.displayName,
    this.description,
    this.avatarFileId,
    this.isOfficial,
    this.isPublic,
    this.onlyAdminCanPost,
    this.metadata,
    this.postCount,
    this.membersCount,
    this.isJoined,
    this.isDeleted,
    this.needApprovalOnPostCreation,
    this.createdAt,
    this.editedAt,
    this.categoryIds,
    this.tags,
    this.allowCommentInStory,
    this.queryTimestamp,
  });
  
  @override
  String? getId() {
    return communityId;
  }


  bool isMatchingFilter(GetCommunityRequest request) {
    return isMatchingCategoryId(request.categoryId) &&
        isMatchingMembershipStatus(request.filter) &&
        isMatchingDeleted(request.isDeleted) &&
        includingTagCondition(request.tags);
  }

  bool isMatchingMembershipStatus(String? filter) {
    if (filter == null) return true;
    if (filter == "member") {
      return isJoined == true;
    } else if ( filter == "notMember") {
      return isJoined == false;
    } else {
      return true;
    }
    
  }

  bool isMatchingDeleted(bool? isDeleted) {
    if (isDeleted == null) return true;
    return this.isDeleted == isDeleted;
  }

  bool isMatchingCategoryId(String? categoryId) {
    if (categoryId == null) return true;
    return categoryIds!.contains(categoryId);
  }

  bool includingTagCondition(List<String>? tags) {
    return tags == null ||
        tags.isEmpty ||
        (tags).toSet().intersection((tags).toSet()).isNotEmpty;
  }

}
