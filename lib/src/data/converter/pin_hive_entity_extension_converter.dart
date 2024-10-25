import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/model/amity_pinned_post.dart';

extension PinHiveEntityExtension on PinHiveEntity {
  AmityPinnedPost convertToAmityPinnedPost() {
    return AmityPinnedPost(
      pinId: pinId,
      postId: referenceId,
      placement: placement,
      target: AmityPinTarget(
        targetId: targetId,
        targetType: targetType,
        lastPinsUpdatedAt: lastPinsUpdatedAt,
      ),
      pinnedById: pinnedBy,
      pinnedAt: pinnedAt,
    );
  }
}
