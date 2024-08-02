import 'package:amity_sdk/src/data/converter/story_target/story_target_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/story_target/story_target_reposnse_conveter_extension.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/story_target_hive_entity_28.dart';
import 'package:amity_sdk/src/data/response/get_global_story_target_response.dart';
import 'package:collection/collection.dart';

extension GetGlobalStoryTargetResponseExtension on GetGlobalStoryTargetResponse {
  
  Future saveToDb<T>(DbAdapterRepo dbRepo) async {

    
    List<FileHiveEntity> fileHiveEntities =
        files.map((e) => e.convertToFileHiveEntity()).toList();

    List<StoryTargetHiveEntity> storyTargetHiveEntities =
        storyTargets.map((e) => e.convertToStoryTargetHiveEntity()).toList();

    List<UserHiveEntity> userHiveEntities =
        users.map((e) => e.convertToUserHiveEntity()).toList();

    List<CommunityHiveEntity> communityHiveEntities =
        communities.map((e) => e.convertToCommunityHiveEntity()).toList();

    List<CommunityCategoryHiveEntity> communityCategoryHiveEntities =
        categories.map((e) => e.convertToCommunityCategoryHiveEntity()).toList();

    List<CommnityMemberHiveEntity> communityUserHiveEntities =
        communityUsers.map((e) => e.convertToCommnityMemberHiveEntity()).toList();

    for (var e in fileHiveEntities) {
      await dbRepo.fileDbAdapter.saveFileEntity(e);
    }

    for (var e in userHiveEntities) {
      await dbRepo.userDbAdapter.saveUserEntity(e);
    }

    for (var e in communityHiveEntities) {
      await dbRepo.communityDbAdapter.saveCommunityEntity(e);
    }

    for (var e in communityCategoryHiveEntities) {
      await dbRepo.communityCategoryDbAdapter.saveCommunityCategoryEntity(e);
    }

    for (var e in storyTargetHiveEntities) {
      await dbRepo.storyTargetDbAdapter.saveStoryTargetEntity(e);
    }

    for (var e in communityUserHiveEntities) {
      final UserHiveEntity? user = userHiveEntities.firstWhereOrNull((element) => element.userId == e.userId);
      await dbRepo.communityMemberDbAdapter.saveCommunityMemberEntity(e, user);
    }

    if (T.toString() == 'AmityStoryTarget') {
      return storyTargetHiveEntities
          .map((e) => e.convertToAmityStoryTarget())
          .toList();
    }
  }
}