import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_story_target_request.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_composer_usercase.dart';
import 'package:amity_sdk/src/domain/composer_usecase/story_target_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/story_target_repo.dart';

class GlobalStoryTargetsUsecase extends UseCase<PageListData<List<AmityStoryTarget>, String>, GetGlobalStoryTargetRequest> {
  
   final StoryTargetRepo storyTargetRepo;
  final StoryTargetComposerUseCase storyTargetComposerUseCase;

  GlobalStoryTargetsUsecase({required this.storyTargetRepo, required this.storyTargetComposerUseCase});

  
  @override
  Future<PageListData<List<AmityStoryTarget>, String>> get(
      GetGlobalStoryTargetRequest params) async {

        final globalTargets = await storyTargetRepo.getGlobalFeed(params);
    final globalTargetsComposed = await Stream.fromIterable(globalTargets.data)
        .asyncMap((event) => storyTargetComposerUseCase.get(event))
        .toList();
    return globalTargets.withItem1(globalTargetsComposed);
    
  }
}
