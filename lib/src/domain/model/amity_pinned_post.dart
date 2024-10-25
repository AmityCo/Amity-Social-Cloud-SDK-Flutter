import 'package:amity_sdk/src/domain/domain.dart';

enum PinPlacement {
  DEFAULT,
  ANNOUNCEMENT,
}

extension PinPlacementValue on PinPlacement {
  String get value {
    switch (this) {
      case PinPlacement.DEFAULT:
        return 'default';
      case PinPlacement.ANNOUNCEMENT:
        return 'announcement';
      default:
        return 'default';
    }
  }
}

class AmityPinnedPost {
  AmityPinnedPost({
    required this.pinId,
    required this.postId,
    this.post,
    required this.placement,
    required this.target,
    required this.pinnedById,
    this.pinnedBy,
    required this.pinnedAt,
  });

  final String pinId;
  final String postId;
  AmityPost? post;
  final String placement;
  final AmityPinTarget target;
  final String pinnedById;
  AmityUser? pinnedBy;
  final DateTime pinnedAt;
}

class AmityPinTarget {
  AmityPinTarget({
    required this.targetId,
    required this.targetType,
    required this.lastPinsUpdatedAt,
  });

  final String targetId;
  final String targetType;
	final DateTime lastPinsUpdatedAt;
}

enum AmityPinSortByOptions {
	lastPinned, lastCreated,
}