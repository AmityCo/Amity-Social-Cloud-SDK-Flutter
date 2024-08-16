import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// Query communities and return paging result for Live Collecion
class CommunityFetchListUseCase extends UseCase<
    PageListData<List<AmityCommunity>, String>, GetCommunityRequest> {
  final CommunityRepo communityRepo;

  CommunityFetchListUseCase({required this.communityRepo});

  @override
  Future<PageListData<List<AmityCommunity>, String>> get(
      GetCommunityRequest params) async {
    return await communityRepo.queryCommunities(params);
  }
}
