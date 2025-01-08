import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

part 'channel_hive_entity_20.g.dart';

/// Data Field for Channel
@HiveType(typeId: 20)
class ChannelHiveEntity extends EkoObject{
  /// Channel Id
  @HiveField(0)
  String? channelId;

  /// Default SubChannel Id
  @HiveField(21)
  String? defaultSubChannelId;

  /// Is Distinct
  @HiveField(1)
  bool? isDistinct;

  /// Metadata
  @HiveField(2)
  Map<String, dynamic>? metadata;

  ///type
  @HiveField(3)
  String? type;

  /// tags
  @HiveField(4)
  List<String>? tags;

  /// is Muted
  @HiveField(5)
  bool? isMuted;

  /// Is Rate Limited
  @HiveField(6)
  bool? isRateLimited;

  /// DateTimeOut
  @HiveField(7)
  DateTime? muteTimeout;

  /// Rate Limit
  @HiveField(8)
  int? rateLimit;

  /// Rate Limit Window
  @HiveField(9)
  int? rateLimitWindow;

  /// Rate Limit Timeout
  @HiveField(10)
  DateTime? rateLimitTimeout;

  ///Display Name
  @HiveField(11)
  String? displayName;

  /// Message Auth DeleteEnable
  @HiveField(12)
  bool? messageAutoDeleteEnabled;

  /// Auto Delete Message By Flag Limit
  @HiveField(13)
  int? autoDeleteMessageByFlagLimit;

  /// Member Count
  @HiveField(14)
  int? memberCount;

  /// Message Count
  @HiveField(15)
  int? messageCount;

  /// Last Activity
  @HiveField(16)
  DateTime? lastActivity;

  /// Create At
  @HiveField(17)
  DateTime? createdAt;

  /// Update At
  @HiveField(18)
  DateTime? updatedAt;

  /// Avatar File id
  @HiveField(19)
  String? avatarFileId;

  /// Is Deleted
  @HiveField(20)
  bool? isDeleted;

  bool isMatchingFilter(GetChannelRequest request) {
    return true;
  }

  ChannelHiveEntity({
    this.channelId,
    this.defaultSubChannelId,
    this.isDistinct,
    this.metadata,
    this.type,
    this.tags,
    this.isMuted,
    this.isRateLimited,
    this.muteTimeout,
    this.rateLimit,
    this.rateLimitWindow,
    this.rateLimitTimeout,
    this.displayName,
    this.messageAutoDeleteEnabled,
    this.autoDeleteMessageByFlagLimit,
    this.memberCount,
    this.messageCount,
    this.lastActivity,
    this.createdAt,
    this.updatedAt,
    this.avatarFileId,
    this.isDeleted,
  });
  
  @override
  String? getId() {
    return channelId;
  }
}
