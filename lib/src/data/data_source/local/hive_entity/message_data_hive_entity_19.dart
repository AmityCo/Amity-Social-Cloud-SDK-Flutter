import 'dart:convert';

import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'message_data_hive_entity_19.g.dart';

/// Data Field for Post
@HiveType(typeId: AmityHiveType.messageData)
class MessageDataHiveEntity extends HiveObject {
  /// Text
  @HiveField(0)
  String? text;

  /// File Id
  @HiveField(1)
  String? fileId;

  /// Stream Id for Live Stream post
  @HiveField(2)
  String? caption;

  /// Thumbnail File Id for video message
  @HiveField(3)
  String? thumbnailFileId;

  /// Change object to Map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'fileId': fileId,
      'caption': caption,
      'thumbnailFileId': thumbnailFileId,
    };
  }

  /// Convert Object to String json
  String toJson() => json.encode(toMap());
}
