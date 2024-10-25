import 'dart:convert';

import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/response/pin_response.dart';
import 'package:amity_sdk/src/data/response/pin_target_response.dart';

PinnedPostQueryResponse pinnedPostQueryResponseFromJson(String str) =>
    PinnedPostQueryResponse.fromJson(json.decode(str));

String pinnedPostQueryResponseToJson(PinnedPostQueryResponse data) =>
    json.encode(data.toJson());

class PinnedPostQueryResponse {
  PinnedPostQueryResponse({
    required this.pinTargets,
    required this.pins,
    required this.posts,
    required this.postChildren,
    required this.comments,
    required this.users,
    required this.files,
    required this.communities,
    required this.communityUsers,
    required this.categories,
    required this.feeds,
    required this.videoStreamings,
    required this.polls,
    required this.paging,
  });

  final List<PinTargetResponse> pinTargets;
  final List<PinResponse> pins;
  final List<PostResponse> posts;
  final List<PostResponse> postChildren;
  final List<CommentResponse> comments;
  final List<UserResponse> users;
  final List<FileResponse> files;
  final List<CommunityResponse> communities;
  final List<CommunityUserResponse> communityUsers;
  final List<CommunityCategoryResponse> categories;
  final List<CommunityFeedResponse> feeds;
  final List<VideoStreamingResponse> videoStreamings;
  final List<PollResponse> polls;
  final PagingResponse? paging;

  PinTargetResponse? getTartget() {
    return (pinTargets.isNotEmpty) ? pinTargets.first : null;
  }

  factory PinnedPostQueryResponse.fromJson(Map<String, dynamic> json) =>
      PinnedPostQueryResponse(
        pinTargets: json["pinTargets"] == null
            ? []
            : List<PinTargetResponse>.from(
              json["pinTargets"].map((x) => PinTargetResponse.fromJson(x))
            ),
        pins: json["pins"] == null
            ? []
            : List<PinResponse>.from(
              json["pins"].map((x) => PinResponse.fromJson(x))
            ),
        posts: json["posts"] == null
            ? []
            : List<PostResponse>.from(
                json["posts"].map((x) => PostResponse.fromJson(x))),
        postChildren: json["postChildren"] == null
            ? []
            : List<PostResponse>.from(
                json["postChildren"].map((x) => PostResponse.fromJson(x))),
        comments: json["comments"] == null
            ? []
            : List<CommentResponse>.from(
                json["comments"].map((x) => CommentResponse.fromJson(x))),
        users: json["users"] == null
            ? []
            : List<UserResponse>.from(
                json["users"].map((x) => UserResponse.fromJson(x))),
        files: json["files"] == null
            ? []
            : List<FileResponse>.from(
                json["files"].map((x) => FileResponse.fromJson(x))),
        communities: json["communities"] == null
            ? []
            : List<CommunityResponse>.from(
                json["communities"].map((x) => CommunityResponse.fromJson(x))),
        communityUsers: json["communityUsers"] == null
            ? []
            : List<CommunityUserResponse>.from(json["communityUsers"]
                .map((x) => CommunityUserResponse.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<CommunityCategoryResponse>.from(json["categories"]
                .map((x) => CommunityCategoryResponse.fromJson(x))),
        feeds: json["feeds"] == null
            ? []
            : List<CommunityFeedResponse>.from(
                json["feeds"].map((x) => CommunityFeedResponse.fromJson(x))),
        videoStreamings: json["videoStreamings"] == null
            ? []
            : List<VideoStreamingResponse>.from(json["videoStreamings"]
                .map((x) => VideoStreamingResponse.fromJson(x))),
        polls: json["polls"] == null
            ? []
            : List<PollResponse>.from(
                json["polls"].map((x) => PollResponse.fromJson(x))),
        paging: json["paging"] == null
            ? null
            : PagingResponse.fromJson(json['paging']),
      );

  Map<String, dynamic> toJson() => {
        "pinTargets": List<dynamic>.from(pinTargets.map((x) => x.toJson())),
        "pins": List<dynamic>.from(pins.map((x) => x.toJson())),
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "postChildren": List<dynamic>.from(postChildren.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "communities": List<dynamic>.from(communities.map((x) => x.toJson())),
        "communityUsers":
            List<dynamic>.from(communityUsers.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "feeds": List<dynamic>.from(feeds.map((x) => x.toJson())),
        "videoStreamings":
            List<dynamic>.from(videoStreamings.map((x) => x.toJson())),
        "polls": List<dynamic>.from(polls.map((x) => x.toJson())),
        "paging": paging,
      };
}
