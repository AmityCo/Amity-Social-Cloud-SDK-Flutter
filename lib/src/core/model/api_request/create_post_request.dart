// To parse this JSON data, do
//
//     final createPostRequest = createPostRequestFromJson(jsonString);

import 'dart:convert';

import 'package:amity_sdk/src/domain/domain.dart';

/// Create Post Request
class CreatePostRequest {
  /// Init [CreatePostRequest]
  CreatePostRequest(
      {this.data,
      this.attachments,
      this.dataType,
      required this.targetType,
      required this.targetId,
      this.metadata,
      this.postId,
      this.mentionees});

  /// Post Data
  CreatePostData? data;

  /// Attachment for the Post
  List<PostAttachmentRequest>? attachments;

  /// Data type for the Post
  String? dataType;

  /// Target Type for the post
  final String targetType;

  /// Target id for the post
  final String targetId;

  /// Meta data for the post
  Map<String, dynamic>? metadata;

  /// Explicit post Id
  String? postId;

  /// Mentionees
  List<AmityMentioneeTarget>? mentionees;


  /// Init [CreatePostRequest] from Json
  factory CreatePostRequest.fromJson(Map<String, dynamic> json) =>
      CreatePostRequest(
        data: CreatePostData.fromJson(json["data"]),
        attachments: List<PostAttachmentRequest>.from(
            json["attachments"].map((x) => PostAttachmentRequest.fromJson(x))),
        dataType: json["dataType"],
        targetType: json["targetType"],
        targetId: json["targetId"],
        metadata: json["metadata"],
        postId: json["postId"],
        mentionees: List<AmityMentioneeTarget>.from(
            json["mentionees"].map((x) => AmityMentioneeTarget.fromJson(x))),
      );

  /// map from [CreatePostRequest]
  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "attachments": attachments == null
            ? null
            : List<dynamic>.from(attachments!.map((x) => x.toJson())),
        "dataType": dataType,
        "targetType": targetType,
        "targetId": targetId,
        "metadata": metadata,
        "postId": postId,
        "mentionees": mentionees == null
            ? null
            : List<dynamic>.from(mentionees!.map((x) => x.toJson())),
      }..removeWhere((key, value) => value == null);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

/// Post Attachment
class PostAttachmentRequest {
  /// Init [PostAttachmentRequest]
  PostAttachmentRequest({
    this.fileId,
    this.videoFileId,
    required this.type,
  });

  /// File Id
  final String? fileId;

  /// Video File Id
  final String? videoFileId;

  /// Type for data
  final String type;

  /// Init [PostAttachmentRequest] from Json
  factory PostAttachmentRequest.fromJson(Map<String, dynamic> json) =>
      PostAttachmentRequest(
        fileId: json["fileId"],
        videoFileId: json["videoFileId"],
        type: json["type"],
      );

  /// map from [PostAttachmentRequest]
  Map<String, dynamic> toJson() => {
        "fileId": fileId,
        "videoFileId": videoFileId,
        "type": type,
      }..removeWhere((key, value) => value == null);
}

/// Post Data
class CreatePostData {
  /// Init [CreatePostData]
  CreatePostData({
    this.text,
    this.streamId,
    this.pollId,
    this.customPostJsonObject
  });

  /// Text Data
  String? text;

  /// Stream Id
  String? streamId;

  /// Poll Id
  String? pollId;

  /// Json object for custom post
  Map<String, dynamic>? customPostJsonObject;

  /// Init [CreatePostData] from Json
  factory CreatePostData.fromJson(Map<String, dynamic> json) => CreatePostData(
        text: json["text"],
        streamId: json["streamId"],
        pollId: json["pollId"],
      );

  /// map from [CreatePostData]
  Map<String, dynamic> toJson() {
    Map<String, dynamic> dataJson = <String, dynamic>{};
    if (customPostJsonObject == null) {
      dataJson['text'] = text;
      dataJson['streamId'] = streamId;
      dataJson['pollId'] = pollId;
    } else {
      dataJson = customPostJsonObject!;
    }
    return dataJson..removeWhere((key, value) => value == null);
  }
}
