import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class AmityReactionRepository {


  /* begin_public_function 
  id: reaction.get_reactions
  */
  /// Get Reactions
  GetReactionQueryBuilder getReactions(AmityReactionReference reactionReference) {
    return GetReactionQueryBuilder.build(reactionReference: reactionReference);
  }
  /* end_public_function */

  /* begin_public_function 
  id: reaction.add_reaction
  */
  /// Add Reaction
  Future addReaction(
      AmityReactionReference reactionReference, String reactionName) async {
    serviceLocator<AddReactionUsecase>().get(ReactionRequest(
        referenceId: reactionReference.referenceId,
        referenceType: reactionReference.referenceType.value,
        reactionName: reactionName));
  }
  /* end_public_function */

  /* begin_public_function 
  id: reaction.remove_reaction
  */
  /// Remove Reaction
  Future removeReaction(
      AmityReactionReference reactionReference, String reactionName) async {
    serviceLocator<RemoveReactionUsecase>().get(ReactionRequest(
        referenceId: reactionReference.referenceId,
        referenceType: reactionReference.referenceType.value,
        reactionName: reactionName));
  }
  /* end_public_function */
}
