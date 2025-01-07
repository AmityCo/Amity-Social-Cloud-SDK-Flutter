// To parse this JSON data, do
//
//     final createMessageRequest = createMessageRequestFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/message_data_hive_entity_19.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/message_hive_entity_18.dart';
import 'package:amity_sdk/src/domain/domain.dart';

CreateMessageRequest createMessageRequestFromJson(String str) => CreateMessageRequest.fromJson(json.decode(str));

String createMessageRequestToJson(CreateMessageRequest data) => json.encode(data.toJson());

/// [CreateMessageRequest]
class CreateMessageRequest {
  /// init [CreateMessageRequest]
  CreateMessageRequest({
    required this.subchannelId,
    this.messageId,
    this.userId,
    this.type,
    this.data,
    this.fileId,
    this.parentId,
    this.metadata,
    this.dataType,
    this.tags,
    this.mentionees,
    this.referenceId
  });

  /// Channel ID
  final String subchannelId;

  /// Message ID
  String? messageId;

  /// User ID
  String? userId;

  /// Type
  String? type;

  /// Data
  CreateMessageData? data;

  /// File Id
  String? fileId;

  /// Parent Id
  String? parentId;

  /// Reference Id
  String? referenceId;

  String?  dataType;

  /// Metadata
  Map<String, dynamic>? metadata;

  /// Tags
  List<String>? tags;

  /// Mentionees
  List<AmityMentioneeTarget>? mentionees;

  /// File Uri
  File? uri;

  factory CreateMessageRequest.fromJson(Map<String, dynamic> json) => CreateMessageRequest(
        subchannelId: json["messageFeedId"],
        messageId: json["messageId"],
        dataType : json["dataType"],
        type: json["type"],
        data: json["data"] == null ? null : CreateMessageData.fromJson(json["data"]),
        fileId: json["fileId"],
        parentId: json["parentId"],
        metadata: json["metadata"],
        referenceId: json["referenceId"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        mentionees: List<AmityMentioneeTarget>.from(json["mentionees"].map((x) => AmityMentioneeTarget.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    return {
      "messageFeedId": subchannelId,
      "messageId": messageId,
      "type": type,
      "referenceId": referenceId,
      "data": data?.toJson(),
      "fileId": fileId,
      "parentId": parentId,
      "dataType": dataType,
      "metadata": metadata,
      "tags": tags == null ? null : tags!.isEmpty ? [] : List<dynamic>.from(tags!.map((x) => x)),
      "mentionees": mentionees == null ? null : List<dynamic>.from(mentionees!.map((x) => x.toJson())),
    }..removeWhere(
        (key, value) => value == null,
    );
  }

  /// Conver [CreateMessageRequest] to [MessageHiveEntity]
  MessageHiveEntity convertToMessageEntity() {
    return MessageHiveEntity()
      ..uniqueId = messageId
      ..messageId = messageId
      ..subChannelId = subchannelId
      ..userId = userId
      ..type = type
      ..data = data!.convertToMessageDataEntity(dataType, messageId!)
      ..parentId = parentId
      ..fileId = fileId
      ..tags = tags
      ..createdAt = DateTime.now()
      ..metadata = metadata; //def
  }
}

///[CreateMessageData]
class CreateMessageData {
  /// Init [CreateMessageData]
  CreateMessageData({
    this.text,
    this.caption,
  });

  /// Text Data
  String? text;

  /// Stream Id
  String? caption;

  /// Init [CreateMessageData] from Json
  factory CreateMessageData.fromJson(Map<String, dynamic> json) => CreateMessageData(
        text: json["text"],
        caption: json["caption"],
      );

  /// map from [CreateMessageData]
  Map<String, dynamic> toJson() => {
        "text": text,
        "caption": caption,
      }..removeWhere((key, value) => value == null);

  /// Convert [CreateMessageData] to [MessageDataHiveEntity]
  MessageDataHiveEntity convertToMessageDataEntity(String? dataType, String messageId) {
    return MessageDataHiveEntity()
      ..text = text
      ..fileId = messageId
      ..caption = caption;
  }
}
