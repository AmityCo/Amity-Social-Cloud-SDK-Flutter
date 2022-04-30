import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_reaction.dart';

extension ReactionHiveEntityExtension on ReactionHiveEntity {
  AmityReaction convertToAmityReaction() {
    return AmityReaction()
      ..reactionId = reactionId
      ..referenceType = referenceType
      ..reactionName = reactionName
      ..userId = userId
      ..userDisplayName = userDisplayName
      ..createdAt = createdAt;
  }
}
