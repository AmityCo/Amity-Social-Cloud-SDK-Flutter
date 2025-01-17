import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_custom_rank_feed_request.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CustomRankingQueryUsecase
    extends UseCase<PageListData<List<AmityPost>, String>, GetCustomRankFeedRequest> {
  final GlobalFeedRepo globalFeedRepo;
  final PostRepo postRepo;
  final PostComposerUsecase postComposerUsecase;
  CustomRankingQueryUsecase({
    required this.globalFeedRepo,
    required this.postRepo,
    required this.postComposerUsecase,
  });

  @override
  Future<PageListData<List<AmityPost>, String>> get(
      GetCustomRankFeedRequest params) async {
    return await globalFeedRepo.queryCustomRankFeed(params);
  }
}
