import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';

class AmitySubChannel {
  final String? subChannelId;
  final String? channelId;
  final AmityChannelType? channelType;
  final String? channelPublicId;
  final String? displayName;
  final int? messageCount;
  final bool? isDeleted;
  final String? latestMessageId;
  final DateTime? lastActivity;
  final String? creatorId;
  final String? creatorPublicId;
  AmityUser? creator;
  final DateTime? editedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? path;
  final String? messagePreviewId;
  // AmityMessagePreview? messagePreview;
  int unreadCount;
  bool hasMentioned;
  bool isMentioned;

  AmitySubChannel({
    required this.subChannelId,
    required this.channelId,
    required this.channelType,
    required this.channelPublicId,
    required this.displayName,
    required this.messageCount,
    required this.isDeleted,
    required this.latestMessageId,
    required this.lastActivity,
    required this.creatorId,
    required this.creatorPublicId,
    this.creator,
    required this.editedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.path,
    this.messagePreviewId,
    // this.messagePreview,
    this.unreadCount = 0,
    this.hasMentioned = false,
    this.isMentioned = false,
  });

   AmityTopicSubscription subscription(){
        return AmityTopicSubscription(AmityTopic.SUB_CHANNEL(this));
    }
}