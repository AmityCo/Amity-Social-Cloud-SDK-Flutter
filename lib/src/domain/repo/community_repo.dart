import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

abstract class CommunityRepo extends AmityObjectRepository<CommunityHiveEntity, AmityCommunity> {
  Future<PageListData<List<AmityCommunity>, String>> getCommunityQuery(
      GetCommunityRequest request);
  List<CommunityHiveEntity> getCommunityEntities(
      RequestBuilder<GetCommunityRequest> request);
  Stream<List<AmityCommunity>> listenCommunity(RequestBuilder<GetCommunityRequest> request);
  Future<List<AmityCommunity>> getRecommendedCommunity(OptionsRequest request);
  Future<List<AmityCommunity>> getTopTrendingCommunity(OptionsRequest request);
  Future<AmityCommunity> createCommunity(CreateCommunityRequest request);
  Future<AmityCommunity?> getCommunityById(String communityId);

  Future<AmityCommunity> getCommunity(String communityId);
  Future deleteCommunity(String communityId);
  Future<AmityCommunity> updateCommunity(CreateCommunityRequest request);
  Future saveCommunityEntity(CommunityHiveEntity entity);

  int getPostCount(String targetId , String feedType);

  Future<AmityCommunityCategory?> getCommunityCategoryById(String categoryId);

  /// Has Local Community
  bool hasLocalCommunity(String communityId);
}
