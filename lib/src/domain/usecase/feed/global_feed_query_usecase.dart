import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class GlobalFeedQueryUsecase
    extends UseCase<PageListData<List<AmityPost>, String>, GetGlobalFeedRequest> {
  final GlobalFeedRepo globalFeedRepo;
  final PostRepo postRepo;
  final PostComposerUsecase postComposerUsecase;
  GlobalFeedQueryUsecase({
    required this.globalFeedRepo,
    required this.postRepo,
    required this.postComposerUsecase,
  });

  @override
  Future<PageListData<List<AmityPost>, String>> get(
      GetGlobalFeedRequest params) async {
    return await globalFeedRepo.queryGlobalFeed(params, false);
  }
}
