import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/query_global_pinned_post_request.dart';
import 'package:amity_sdk/src/domain/model/amity_pinned_post.dart';
import 'package:amity_sdk/src/domain/repo/pin_repo.dart';

class GlobalPinnedPostQueryUseCase extends UseCase<
    PageListData<List<AmityPinnedPost>, String>, QueryGlobalPinnedPostRequest> {
  final PinRepo pinRepo;

  GlobalPinnedPostQueryUseCase({required this.pinRepo});

  @override
  Future<PageListData<List<AmityPinnedPost>, String>> get(
      QueryGlobalPinnedPostRequest request) async {
    print("GlobalPinnedPostQueryUseCase");
    return await pinRepo.queryGlobalPinnedPost(request);
  }
}
