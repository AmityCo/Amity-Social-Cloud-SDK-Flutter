import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_custom_rank_feed_request.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class GetCustomRankingUseCase extends UseCase<
    PageListData<List<AmityPost>, String>, GetCustomRankFeedRequest> {
  final GlobalFeedRepo _feedRepo;
  final PostComposerUsecase _postComposerUsecase;

  GetCustomRankingUseCase(this._feedRepo, this._postComposerUsecase);

  @override
  Future<PageListData<List<AmityPost>, String>> get (
      GetCustomRankFeedRequest params) async  {
    final amityPost = await _feedRepo.getCustomPostRanking(params);
    final amityComposedPost = await Stream.fromIterable(amityPost.data)
        .asyncMap((event) => _postComposerUsecase.get(event))
        .toList();
    return amityPost.withItem1(amityComposedPost);
  }
}
