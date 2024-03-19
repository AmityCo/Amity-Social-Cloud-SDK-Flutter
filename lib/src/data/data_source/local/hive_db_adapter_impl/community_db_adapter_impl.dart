import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

class CommunityDbAdapterImpl extends CommunityDbAdapter {
  final DBClient dbClient;

  CommunityDbAdapterImpl({required this.dbClient});
  late Box<CommunityHiveEntity> box;
  Future<CommunityDbAdapterImpl> init() async {
    Hive.registerAdapter(CommunityHiveEntityAdapter(), override: true);
    box = await Hive.openBox<CommunityHiveEntity>('community_db');
    return this;
  }

  @override
  CommunityHiveEntity? getCommunityEntity(String id) {
    return box.get(id);
  }

  @override
  Future saveCommunityEntity(CommunityHiveEntity entity) async {
    await box.put(entity.communityId, entity);
  }

  @override
  Stream<CommunityHiveEntity> listenCommunityEntity(String communityId) {
    return box.watch(key: communityId).map((event) => event.value);
  }

  @override
  Stream<List<CommunityHiveEntity>> listenCommunityEntities(
      RequestBuilder<GetCommunityRequest> request) {
    return box.watch().map((event) => box.values
        .toList());
  }
  
  @override
  Future deleteCommunityEntitiesByTargetId(String? targetId) async {
    box.values.toList()
        .forEach((element) {
      box.delete(element.communityId);
    });
    return;
  }
}
