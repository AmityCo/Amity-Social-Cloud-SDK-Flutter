// To parse this JSON data, do
//
//     final messageQueryRequest = messageQueryRequestFromJson(jsonString);

import 'dart:convert';

import 'package:amity_sdk/src/core/core.dart';

MessageQueryRequest messageQueryRequestFromJson(String str) =>
    MessageQueryRequest.fromJson(json.decode(str));

String messageQueryRequestToJson(MessageQueryRequest data) =>
    json.encode(data.toJson());

/// [MessageQueryRequest]
class MessageQueryRequest {
  /// init [MessageQueryRequest]
  MessageQueryRequest(
      {required this.subChannelId,
      this.type,
      this.parentId,
      this.filterByParentId,
      this.hasFlag,
      this.isDeleted,
      this.tags,
      this.excludeTags,
      this.options,
      this.stackFromEnd});

  /// Channel ID
  final String subChannelId;

  /// Type
  String? type;

  /// Parent ID
  String? parentId;

  /// Filter By Parent Id
  bool? filterByParentId;

  /// Hash flag
  bool? hasFlag;

  /// Is Deleted
  bool? isDeleted;

  /// Tags
  List<String>? tags;

  /// Exclude Tags
  List<String>? excludeTags;

  /// Option
  OptionsRequest? options;

  /// Stack from end, only use internally
  bool? stackFromEnd = false;

  /// [MessageQueryRequest]
  factory MessageQueryRequest.fromJson(Map<String, dynamic> json) =>
      MessageQueryRequest(
        subChannelId: json["messageFeedId"],
        type: json["type"],
        parentId: json["parentId"],
        filterByParentId: json["filterByParentId"],
        hasFlag: json["hasFlag"],
        isDeleted: json["isDeleted"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        excludeTags: List<String>.from(json["excludeTags"].map((x) => x)),
        options: OptionsRequest.fromJson(json["options"]),
      );

  /// Convert [MessageQueryRequest] to Map
  Map<String, dynamic> toJson() => {
        "messageFeedId": subChannelId,
        "type": type,
        "parentId": parentId,
        "filterByParentId": filterByParentId,
        "hasFlag": hasFlag,
        "isDeleted": isDeleted,
        "tags[]": tags == null ? null : List<String>.from(tags!.map((x) => x)),
        "excludeTags[]": excludeTags == null
            ? null
            : List<String>.from(excludeTags!.map((x) => x)),
        "options": options?.toJson(),
      }..removeWhere((key, value) => value == null);
}
