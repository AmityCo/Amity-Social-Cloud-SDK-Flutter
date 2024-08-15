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
    final cachedEntity = getCommunityEntity(entity.communityId!);    
    if (cachedEntity != null) {
      // If cache exist we update queryTimestamp and use cachd isJoined.      
      entity.isJoined ??= cachedEntity.isJoined;
      entity.queryTimestamp = cachedEntity.queryTimestamp;
    }
    await box.put(entity.communityId, entity);
  }

  @override
  Stream<CommunityHiveEntity> listenCommunityEntity(String communityId) {
    return box.watch(key: communityId).where((event) { return event != null && event.value != null; }).map((event) => event.value);
  }

  @override
  List<CommunityHiveEntity> getCommunityEntities(
      RequestBuilder<GetCommunityRequest> request) {
    return box.values.where((community) => community.isMatchingFilter(request.call())).toList();
  }

  @override
  Stream<List<CommunityHiveEntity>> listenCommunityEntities(
      RequestBuilder<GetCommunityRequest> request) {
    return box.watch().map((event) => box.values
        .where((community) => community.isMatchingFilter(request.call()))
        .toList());
  }

  @override
  Future deleteCommunityEntities() async {
    box.values.toList().forEach((element) {      
      element.delete();
    });
    return;
  }
}
