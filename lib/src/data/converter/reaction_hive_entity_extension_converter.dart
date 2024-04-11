import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_reaction.dart';

extension ReactionHiveEntityExtension on ReactionHiveEntity {
  AmityReaction convertToAmityReaction() {
    return AmityReaction()
      ..reactionId = reactionId
      ..reactionName = reactionName
      ..referenceId = referenceId
      ..referenceType = referenceType
      ..userId = userId
      ..userDisplayName = userDisplayName
      ..createdAt = createdAt;
  }

  bool isMatchingFilter(GetReactionRequest request) {
    return isMatchingReferenceType(request.referenceType) &&
        isMatchingReferenceId(request.referenceId) &&
        isMatchingReactionName(request.reactionName);
  }

  bool isMatchingReferenceType(String referenceType) {
    return this.referenceType == referenceType;
  }

  bool isMatchingReferenceId(String referenceId) {
    return this.referenceId == referenceId;
  }

  bool isMatchingReactionName(String? reactionName) {
    return reactionName == null || this.reactionName == reactionName;
  }
}
