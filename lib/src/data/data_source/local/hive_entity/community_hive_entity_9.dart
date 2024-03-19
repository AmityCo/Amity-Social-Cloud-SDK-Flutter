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

  CommunityHiveEntity(
    {
      this.communityId = ''
    });
  
  @override
  String? getId() {
    return communityId;
  }

}
