import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/data/response/create_story_response.dart';
import 'package:amity_sdk/src/data/response/get_story_targets_by_targets_response.dart';

abstract class StoryTargetApiInterface{
  Future<GetStoryTargetsByTargets> queryStoryTargets( GetTargetsByTargetsRequest request);
}