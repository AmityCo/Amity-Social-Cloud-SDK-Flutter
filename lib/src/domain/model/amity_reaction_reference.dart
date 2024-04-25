import 'package:amity_sdk/amity_sdk.dart';

sealed class AmityReactionReference {
  final AmityReactionReferenceType referenceType;
  final String referenceId;

  AmityReactionReference({
    required this.referenceType,
    required this.referenceId,
  });
}

class AmityPostReactionReference extends AmityReactionReference {
  AmityPostReactionReference({
    required super.referenceId,
  }) : super(
          referenceType: AmityReactionReferenceType.POST,
        );
}

class AmityCommentReactionReference extends AmityReactionReference {
  AmityCommentReactionReference({
    required super.referenceId,
  }) : super(
          referenceType: AmityReactionReferenceType.COMMENT,
        );
}

class AmityMessageReactionReference extends AmityReactionReference {
  AmityMessageReactionReference({
    required super.referenceId,
  }) : super(
          referenceType: AmityReactionReferenceType.MESSAGE,
        );
}

class AmityStoryReactionReference extends AmityReactionReference {
  AmityStoryReactionReference({
    required super.referenceId,
  }) : super(
          referenceType: AmityReactionReferenceType.STORY,
        );
}
