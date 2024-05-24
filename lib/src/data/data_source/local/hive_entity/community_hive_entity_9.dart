import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:hive/hive.dart';

part 'community_hive_entity_9.g.dart';

@HiveType(typeId: 9)
class CommunityHiveEntity extends EkoObject {
  String communityId;
  String? path;
  String? channelId;
  String? userId;
  String? displayName;
  String? description;
  String? avatarFileId;
  bool? isOfficial;
  bool? isPublic = false;
  bool? onlyAdminCanPost = false;
  Map<String, dynamic>? metadata;
  int? postCount = 0;
  int? membersCount = 0;
  bool? isJoined = false;
  bool? isDeleted = false;
  bool? needApprovalOnPostCreation = false;
  DateTime? createdAt;
  DateTime? editedAt;
  List<String>? categoryIds;
  List<String>? tags;
  bool? allowCommentInStory;
  // Special timestamp for sorting displayName when query with live collection
  // Should be remove when do queryStream.
  DateTime? queryTimestamp;

  CommunityHiveEntity(
    {
      this.communityId = ''
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
