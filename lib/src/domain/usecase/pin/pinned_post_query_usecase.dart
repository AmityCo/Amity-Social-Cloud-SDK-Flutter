import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/domain/model/amity_pinned_post.dart';
import 'package:amity_sdk/src/domain/repo/pin_repo.dart';

/// Query communities and return paging result for Live Collecion
class PinnedPostQueryUseCase extends UseCase<
    PageListData<List<AmityPinnedPost>, String>, QueryPinnedPostRequest> {
  final PinRepo pinRepo;

  PinnedPostQueryUseCase({required this.pinRepo});

  @override
  Future<PageListData<List<AmityPinnedPost>, String>> get(
      QueryPinnedPostRequest request) async {
    return await pinRepo.queryPinnedPost(request);
  }
}
