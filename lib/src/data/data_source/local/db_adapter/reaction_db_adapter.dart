import 'package:amity_sdk/src/data/data_source/local/hive_entity/reaction_hive_entity_8.dart';
import 'package:amity_sdk/src/src.dart';

abstract class ReactionDbAdapter {
  Future saveReactionEntity(ReactionHiveEntity data);
  Future deleteReactionEntity(ReactionHiveEntity data);
  ReactionHiveEntity? getReactionEntity(String reactionId);
  Stream<List<ReactionHiveEntity>> listenReactionEntities(
    RequestBuilder<GetReactionRequest> request);
  Future clearOldReactions(GetReactionRequest request);
}
