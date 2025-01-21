import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

class ReactionDbAdapterImpl extends ReactionDbAdapter {
  ReactionDbAdapterImpl({required this.dbClient});
  final DBClient dbClient;
  late Box<ReactionHiveEntity> box;
  Future<ReactionDbAdapter> init() async {
    Hive.registerAdapter(ReactionHiveEntityAdapter(), override: true);
    box = await Hive.openBox<ReactionHiveEntity>('reaction_db');
    return this;
  }

  @override
  Future deleteReactionEntity(ReactionHiveEntity data) async {
    await box.delete(data.reactionId);
  }

  @override
  ReactionHiveEntity? getReactionEntity(String reactionId) {
    return box.get(reactionId);
  }

  @override
  Future saveReactionEntity(ReactionHiveEntity data) async {
    await box.put(data.reactionId, data);
  }

  @override
  Stream<List<ReactionHiveEntity>> listenReactionEntities(
      RequestBuilder<GetReactionRequest> request) {
    return box.watch().map((event) => box.values
        .where((reaction) => reaction.isMatchingFilter(request.call()))
        .toList());
  }

  @override
  Future clearOldReactions(GetReactionRequest request) async {
    box.values
        .where((reaction) => reaction.isMatchingFilter(request))
        .toList()
        .forEach((element) {
      box.delete(element.reactionId);
    });
  }

  @override
  List<ReactionHiveEntity> getReactionEntities(
      RequestBuilder<GetReactionRequest> request) {
    return box.values
        .where((reactions) => reactions.isMatchingFilter(request.call()))
        .toList();
  }
}
