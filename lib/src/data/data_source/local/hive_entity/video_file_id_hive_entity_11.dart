import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:hive/hive.dart';

part 'video_file_id_hive_entity_11.g.dart';

@HiveType(typeId: AmityHiveType.videoFileId)
class VideoFileIdHiveEntity {
  String? original;
  String? low;
  String? medium;
  String? high;
}
