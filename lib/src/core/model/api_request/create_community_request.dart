import 'dart:convert';

import 'package:amity_sdk/amity_sdk.dart';

CreateCommunityRequest createPostRequestFromJson(String str) =>
    CreateCommunityRequest.fromJson(json.decode(str));

String createPostRequestToJson(CreateCommunityRequest data) =>
    json.encode(data.toJson());

class CreateCommunityRequest {
  CreateCommunityRequest({
    this.communityId,
    this.displayName,
    this.categoryIds,
    this.description,
    this.isPublic,
    this.metadata,
    this.userIds,
    this.tags,
    this.avatarFileId,
    this.needApprovalOnPostCreation,
    this.onlyAdminCanPost,
    this.allowCommentInStory,
  });
  String? communityId;
  String? displayName;
  List<String>? categoryIds;
  String? description;
  bool? isPublic;
  Map<String, dynamic>? metadata;
  List<String>? userIds;
  List<String>? tags;
  String? avatarFileId;
  bool? needApprovalOnPostCreation;
  bool? onlyAdminCanPost;
  bool? allowCommentInStory;

  factory CreateCommunityRequest.fromJson(Map<String, dynamic> json) =>
      CreateCommunityRequest(
        communityId: json["communityId"],
        displayName: json["displayName"],
        categoryIds: List<String>.from(
            json["categoryIds"].map((categoryId) => categoryId.toString())),
        description: json["description"],
        isPublic: json["isPublic"],
        userIds: List<String>.from(
            json["userIds"].map((userId) => userId.toString())),
        tags: List<String>.from(json["tags"].map((tag) => tag.toString())),
        avatarFileId: json["avatarFileId"],
        metadata: json["metadata"],
        needApprovalOnPostCreation: json["needApprovalOnPostCreation"],
        onlyAdminCanPost: json["onlyAdminCanPost"],
        allowCommentInStory : json["allowCommentInStory"],
      );

  Map<String, dynamic> toJson() => {
        "communityId": communityId,
        "displayName": displayName,
        "categoryIds": categoryIds,
        "description": description,
        "isPublic": isPublic,
        "metadata": metadata,
        "userIds": userIds,
        "tags": tags,
        "avatarFileId": avatarFileId,
        "needApprovalOnPostCreation": needApprovalOnPostCreation,
        "onlyAdminCanPost": onlyAdminCanPost,
        "allowCommentInStory": allowCommentInStory,
      }..removeWhere((key, value) => value == null);

  @override
  String toString() {
    return createPostRequestToJson(this);
  }
}
