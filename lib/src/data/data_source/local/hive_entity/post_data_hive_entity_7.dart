import 'dart:convert';

import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'post_data_hive_entity_7.g.dart';

/// Data Field for Post
@HiveType(typeId: AmityHiveType.postChildData)
class PostChildDataHiveEntity {
  /// Text
  @HiveField(0)
  String? text;

  /// File Id
  @HiveField(1)
  String? fileId;

  /// Thumbnail File Id for Video
  @HiveField(2)
  String? thumbnailFileId;

  /// Video  File Id
  @HiveField(3)
  Map<String, String>? videoFileId;

  /// Stream Id for Live Stream post
  @HiveField(4)
  String? streamId;

  /// Poll Id for Poll Post
  @HiveField(5)
  String? pollId;

  PostChildDataHiveEntity({
    this.text,
    this.fileId,
    this.thumbnailFileId,
    this.videoFileId,
    this.streamId,
    this.pollId,
  });

  /// Change object to Map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'fileId': fileId,
      'thumbnailFileId': thumbnailFileId,
      'videoFileId': videoFileId,
      'streamId': streamId,
      'pollId': pollId,
    };
  }

  /// Convert Object to String json
  String toJson() => json.encode(toMap());
}
