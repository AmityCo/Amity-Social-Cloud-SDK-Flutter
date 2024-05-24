import 'package:amity_sdk/src/data/response/core_response/story_target_response.dart';
import 'package:amity_sdk/src/data/response/response.dart';

class GetGlobalStoryTargetResponse {
  final List<StoryTargetResponse> storyTargets;
  final List<UserResponse> users;
  final List<FileResponse> files;
  final List<CommunityResponse> communities;
  final List<CommunityUserResponse> communityUsers;
  final List<CommunityCategoryResponse> categories;

  /// Paging
  final PagingResponse? paging;

  GetGlobalStoryTargetResponse(
      {required this.paging,
      required this.users,
      required this.files,
      required this.communities,
      required this.communityUsers,
      required this.categories,
      required this.storyTargets});

  factory GetGlobalStoryTargetResponse.fromJson(Map<String, dynamic> json) =>
      GetGlobalStoryTargetResponse(
        storyTargets: json["storyTargets"] == null
            ? []
            : List<StoryTargetResponse>.from(json["storyTargets"]
                .map((x) => StoryTargetResponse.fromJson(x))),
        users: List<UserResponse>.from(
            json["users"].map((x) => UserResponse.fromJson(x))),
        files: List<FileResponse>.from(
            json["files"].map((x) => FileResponse.fromJson(x))),
        communities: List<CommunityResponse>.from(
            json["communities"].map((x) => CommunityResponse.fromJson(x))),
        communityUsers: List<CommunityUserResponse>.from(json["communityUsers"]
            .map((x) => CommunityUserResponse.fromJson(x))),
        categories: List<CommunityCategoryResponse>.from(json["categories"]
            .map((x) => CommunityCategoryResponse.fromJson(x))),
        paging: json["paging"] == null
            ? null
            : PagingResponse.fromJson(json["paging"]),
      );

  Map<String, dynamic> toJson() => {
        "storyTargets": List<dynamic>.from(storyTargets.map((x) => x.toJson())),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "communities": List<dynamic>.from(communities.map((x) => x.toJson())),
        "communityUsers":
            List<dynamic>.from(communityUsers.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "paging": paging?.toJson(),
      };
}
