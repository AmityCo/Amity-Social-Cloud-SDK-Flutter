import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CommunityGetUseCase extends UseCase<AmityCommunity, String> {
  final CommunityRepo communityRepo;
  final CommunityComposerUsecase communityComposerUsecase;

  CommunityGetUseCase(
      {required this.communityRepo, required this.communityComposerUsecase});
  @override
  Future<AmityCommunity> get(String params) async {
    final amityCommunity = await communityRepo.getCommunity(params);
    final amityCommunityComposed =
        await communityComposerUsecase.get(amityCommunity);
    return amityCommunityComposed;
  }
}

/// Live Object
class CommunityGetUsecase extends UseCase<
    PageListData<List<AmityCommunity>, String>, GetCommunityRequest> {
  final CommunityRepo communityRepo;
  final CommunityComposerUsecase communityComposerUsecase;
  CommunityGetUsecase(
      {required this.communityRepo, required this.communityComposerUsecase});

  @override
  Future<PageListData<List<AmityCommunity>, String>> get(
      GetCommunityRequest params) async {
    final amityCommunity = await communityRepo.getCommunityQuery(params);
    final amityComposedCommunity =
        await Stream.fromIterable(amityCommunity.data)
            .asyncMap((event) => communityComposerUsecase.get(event))
            .toList();
    return amityCommunity.withItem1(amityComposedCommunity);
  }
}
