import 'package:amity_sdk/src/core/model/api_request/get_global_story_target_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/data/response/get_global_story_target_response.dart';
import 'package:amity_sdk/src/data/response/get_story_targets_by_targets_response.dart';

abstract class StoryTargetApiInterface{
  Future<GetStoryTargetsByTargets> queryStoryTargets( GetTargetsByTargetsRequest request);
  Future<GetGlobalStoryTargetResponse> queryGlobalFeed( GetGlobalStoryTargetRequest request);
}