import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/pin_api_interface.dart';
import 'package:amity_sdk/src/data/response/pinned_post_response.dart';
import 'package:dio/dio.dart';

class PinApiInterfaceImpl extends PinApiInterface {
  
  PinApiInterfaceImpl({required this.httpApiClient});

  final HttpApiClient httpApiClient;

  @override
  Future<PinnedPostQueryResponse> queryPinnedPost(String communityId) async {
    try {
      final data = await httpApiClient().get("$PINNED_POST_QUERY/$communityId");
      return PinnedPostQueryResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<PinnedPostQueryResponse> queryPinnedPostWithPlacement(QueryPinnedPostRequest request) async {
    try {
      final data = await httpApiClient().get("$PINNED_POST_QUERY/${request.targetId}/${request.placement}");
      return PinnedPostQueryResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }
}
