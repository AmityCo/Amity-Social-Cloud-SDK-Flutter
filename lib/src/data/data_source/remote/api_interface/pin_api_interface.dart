import 'package:amity_sdk/src/core/model/api_request/query_global_pinned_post_request.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/data/response/pinned_post_response.dart';

abstract class PinApiInterface {
  Future<PinnedPostQueryResponse> queryPinnedPost(String communityId);

  Future<PinnedPostQueryResponse> queryPinnedPostWithPlacement(
      QueryPinnedPostRequest request);

  Future<PinnedPostQueryResponse> queryGlobalPinnedPost(
      QueryGlobalPinnedPostRequest request);
}
