import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/community_hive_entity_9.dart';

abstract class CommunityDbAdapter {
  Future saveCommunityEntity(CommunityHiveEntity entity);
  Future deleteCommunityEntities();
  CommunityHiveEntity? getCommunityEntity(String id);
  List<CommunityHiveEntity> getCommunityEntities(
      RequestBuilder<GetCommunityRequest> request);
  Stream<CommunityHiveEntity> listenCommunityEntity(String communityId);
  Stream<List<CommunityHiveEntity>> listenCommunityEntities(
      RequestBuilder<GetCommunityRequest> request);
}
