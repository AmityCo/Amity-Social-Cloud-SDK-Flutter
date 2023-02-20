// To parse this JSON data, do
//
//     final updateCommentRequest = updateCommentRequestFromJson(jsonString);

import 'dart:convert';

import 'package:amity_sdk/src/domain/domain.dart';

UpdateCommentRequest updateCommentRequestFromJson(String str) =>
    UpdateCommentRequest.fromJson(json.decode(str));

String updateCommentRequestToJson(UpdateCommentRequest data) =>
    json.encode(data.toJson());

class UpdateCommentRequest {
  UpdateCommentRequest({required this.commentId, this.data, this.metadata});

  String commentId;
  UpdateCommentData? data;
  Map<String, dynamic>? metadata;

  /// Mentionees
  List<AmityMentioneeTarget>? mentionees;

  factory UpdateCommentRequest.fromJson(Map<String, dynamic> json) =>
      UpdateCommentRequest(
        commentId: json["commentId"],
        data: UpdateCommentData.fromJson(json["data"]),
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "commentId": commentId,
        "data": data?.toJson(),
        "metadata": metadata,
        "mentionees": mentionees == null
            ? null
            : List<dynamic>.from(mentionees!.map((x) => x.toJson())),
      }..removeWhere((key, value) => value == null);
}

class UpdateCommentData {
  UpdateCommentData({
    this.text,
  });

  String? text;

  factory UpdateCommentData.fromJson(Map<String, dynamic> json) =>
      UpdateCommentData(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      }..removeWhere((key, value) => value == null);
}
