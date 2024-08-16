import 'package:hive/hive.dart';

part 'channel_user_hive_entity_21.g.dart';

/// Data Field for Channel
@HiveType(typeId: 21)
class ChannelUserHiveEntity extends HiveObject {
  /// Channel User Id
  @HiveField(0)
  String? id;

  /// User Id
  @HiveField(1)
  String? userId;

  /// Channel Id
  @HiveField(2)
  String? channelId;

  /// Membership
  @HiveField(3)
  String? membership;

  /// Is Banned
  @HiveField(4)
  bool? isBanned;

  /// Last Activity
  @HiveField(5)
  DateTime? lastActivity;

  /// Roles
  @HiveField(6)
  List<String>? roles;

  /// Permissions
  @HiveField(7)
  List<String>? permissions;

  /// Read to Segment
  @HiveField(8)
  int? readToSegment;

  /// Last Mentioned Segment
  @HiveField(9)
  int? lastMentionedSegment;

  /// Is Deleted
  @HiveField(10)
  bool? isDeleted;

  /// Is Mute
  @HiveField(11)
  bool? isMuted;

  /// Mute Timeout
  @HiveField(12)
  DateTime? muteTimeout;

  /// Create At
  @HiveField(13)
  DateTime? createdAt;

  /// Update At
  @HiveField(14)
  DateTime? updatedAt;

  ChannelUserHiveEntity({
    this.id,
    this.userId,
    this.channelId,
    this.membership,
    this.isBanned,
    this.lastActivity,
    this.roles,
    this.permissions,
    this.readToSegment,
    this.lastMentionedSegment,
    this.isDeleted,
    this.isMuted,
    this.muteTimeout,
    this.createdAt,
    this.updatedAt,
  });
}
