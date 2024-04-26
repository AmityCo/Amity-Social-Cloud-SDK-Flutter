import 'dart:core';

import 'package:amity_sdk/amity_sdk.dart';

sealed class AmityStoryTarget {
  final String uniqueId;
  final AmityStoryTargetType targetType;
  final String targetId;
  DateTime? lastStoryExpiresAt;
  DateTime? lastStorySeenExpiresAt;
  bool hasUnseen;
  DateTime? localSortingDate;
  final DateTime? localLastStoryExpiresAt;
  final DateTime? localLastStorySeenExpiresAt;
  int syncingStoriesCount;
  int failedStoriesCount;
  final DateTime? updatedAt;
  DateTime? highestSeen;

  AmityStoryTarget(
      {required this.uniqueId,
      required this.targetType,
      required this.targetId,
      this.lastStoryExpiresAt,
      this.lastStorySeenExpiresAt,
      this.hasUnseen = false,
      this.localSortingDate,
      this.localLastStoryExpiresAt,
      this.localLastStorySeenExpiresAt,
      this.syncingStoriesCount = 0,
      this.failedStoriesCount = 0,
      this.updatedAt,
      this.highestSeen});

  String getTargetId() {
    return targetId;
  }

  AmityStoryTargetType getTargetType() {
    return targetType;
  }

  int getSyncingStoriesCount() {
    return syncingStoriesCount;
  }

  int getFailedStoriesCount() {
    return failedStoriesCount;
  }

  static String generateUniqueId(String targetType, String targetId) {
    return "$targetType/$targetId";
  }
}

class AmityStoryTargetCommunity extends AmityStoryTarget {
  AmityCommunity? community;
  AmityStoryTargetCommunity({
    this.community,
    required String targetId,
    DateTime? lastStoryExpiresAt,
    DateTime? lastStorySeenExpiresAt,
    bool hasUnseen = false,
    DateTime? localSortingDate,
    DateTime? localLastStoryExpiresAt,
    DateTime? localLastStorySeenExpiresAt,
    int syncingStoriesCount = 0,
    int failedStoriesCount = 0,
    DateTime? updatedAt,
    DateTime? highestSeen,
  }) : super(
            uniqueId: AmityStoryTarget.generateUniqueId(
                AmityStoryTargetType.COMMUNITY.value, targetId),
            targetType: AmityStoryTargetType.COMMUNITY,
            targetId: targetId,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: hasUnseen,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt,
            syncingStoriesCount: syncingStoriesCount,
            failedStoriesCount: failedStoriesCount,
            updatedAt: updatedAt,
            highestSeen: highestSeen);
}

class AmityStoryTargetUser extends AmityStoryTarget {
  AmityStoryTargetUser(
      {required String targetId,
      DateTime? lastStoryExpiresAt,
      DateTime? lastStorySeenExpiresAt,
      bool hasUnseen = false,
      DateTime? localSortingDate,
      DateTime? localLastStoryExpiresAt,
      DateTime? localLastStorySeenExpiresAt,
      int syncingStoriesCount = 0,
      int failedStoriesCount = 0,
      DateTime? updatedAt,
      DateTime? highestSeen})
      : super(
            uniqueId: AmityStoryTarget.generateUniqueId(
                AmityStoryTargetType.USER.value, targetId),
            targetType: AmityStoryTargetType.USER,
            targetId: targetId,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: hasUnseen,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt,
            syncingStoriesCount: syncingStoriesCount,
            failedStoriesCount: failedStoriesCount,
            updatedAt: updatedAt,
            highestSeen: highestSeen);
}

class AmityStoryTargetUnknown extends AmityStoryTarget {
  AmityStoryTargetUnknown(
      {required String targetId,
      DateTime? lastStoryExpiresAt,
      DateTime? lastStorySeenExpiresAt,
      bool hasUnseen = false,
      DateTime? localSortingDate,
      DateTime? localLastStoryExpiresAt,
      DateTime? localLastStorySeenExpiresAt,
      int syncingStoriesCount = 0,
      int failedStoriesCount = 0,
      DateTime? updatedAt,
      DateTime? highestSeen})
      : super(
            uniqueId: AmityStoryTarget.generateUniqueId(
                AmityStoryTargetType.UNKNOWN.value, targetId),
            targetType: AmityStoryTargetType.UNKNOWN,
            targetId: targetId,
            lastStoryExpiresAt: lastStoryExpiresAt,
            lastStorySeenExpiresAt: lastStorySeenExpiresAt,
            hasUnseen: hasUnseen,
            localSortingDate: localSortingDate,
            localLastStoryExpiresAt: localLastStoryExpiresAt,
            localLastStorySeenExpiresAt: localLastStorySeenExpiresAt,
            syncingStoriesCount: syncingStoriesCount,
            failedStoriesCount: failedStoriesCount,
            updatedAt: updatedAt,
            highestSeen: highestSeen);
}
