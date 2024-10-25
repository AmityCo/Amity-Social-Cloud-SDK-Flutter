import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:hive/hive.dart';

part 'sub_channel_hive_entity_35.g.dart';

@HiveType(typeId: 35)
class SubChannelHiveEntity extends EkoObject {
  // @HiveField(0)
  String? subChannelId;

  // @HiveField(1)
  String? channelId;

  // @HiveField(2)
  String? channelPublicId;

  // @HiveField(3)
  String? networkId;

  // @HiveField(4)
  String? channelType;

  // @HiveField(5)
  String? name;

  // @HiveField(6)
  int? messageCount;

  // @HiveField(7)
  bool? isDeleted;

  // @HiveField(8)
  String? latestMessageId;

  // @HiveField(9)
  DateTime? lastActivity;

  // @HiveField(10)
  String? creatorId;

  // @HiveField(11)
  String? creatorPublicId;

  // @HiveField(12)
  String? path;

  // @HiveField(13)
  DateTime? editedAt;

  // @HiveField(14)
  int? subChannelMarkerHash;

  // @HiveField(15)
  int? userSubChannelMarkerHash;

  // @HiveField(16)
  String? messagePreviewId;
  

  SubChannelHiveEntity({
    this.subChannelId,
    this.channelId,
    this.channelPublicId,
    this.networkId,
    this.channelType,
    this.name,
    this.messageCount,
    this.isDeleted,
    this.latestMessageId,
    this.lastActivity,
    this.creatorId,
    this.creatorPublicId = '',
    this.path = '',
     this.editedAt,
    this.subChannelMarkerHash = 0,
    this.userSubChannelMarkerHash = 0,
    this.messagePreviewId,
  });

  // @override
  // String? getId() {
  //   return subChannelId;
  // }

  @override
  String? getId() {
    return subChannelId;
  }
}
