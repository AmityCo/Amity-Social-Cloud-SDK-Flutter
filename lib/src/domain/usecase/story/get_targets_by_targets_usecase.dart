import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class GetTargetByTargetsUsecase
    extends UseCase<List<AmityStoryTarget>, GetTargetsByTargetsRequest> {
  final StoryTargetRepo storyTargetRepo;

  GetTargetByTargetsUsecase({required this.storyTargetRepo});

  @override
  Future<List<AmityStoryTarget>> get(GetTargetsByTargetsRequest params) {
    return storyTargetRepo.getStoryTargets(params);
  }
}
