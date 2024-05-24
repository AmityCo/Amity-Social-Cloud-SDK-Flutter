import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_story_target_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/story_target_api_interface.dart';
import 'package:amity_sdk/src/data/response/get_global_story_target_response.dart';
import 'package:amity_sdk/src/data/response/get_story_targets_by_targets_response.dart';
import 'package:dio/dio.dart';

class StoryTargetApiInterfaceImpl extends StoryTargetApiInterface{

  final HttpApiClient httpApiClient;

  StoryTargetApiInterfaceImpl({required this.httpApiClient});

  @override
  Future<GetStoryTargetsByTargets> queryStoryTargets(GetTargetsByTargetsRequest request) async {
    try {
      final data = await httpApiClient().get(
           STORIES_SEEN,
          queryParameters: request.toJson());
      return GetStoryTargetsByTargets.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }

  @override
  Future<GetGlobalStoryTargetResponse> queryGlobalFeed(GetGlobalStoryTargetRequest request) async {
    try {
      final data = await httpApiClient().get(
           STORIES_TARGETS_GLOBAL,
          queryParameters: request.toJson());
      return GetGlobalStoryTargetResponse.fromJson(data.data);
    } on DioException catch (error) {
      final amityError = AmityErrorResponse.fromJson(error.response!.data);
      return Future.error(amityError.amityException());
    }
  }
  

}