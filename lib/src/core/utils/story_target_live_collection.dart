import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_targets_by_targets_request.dart';
import 'package:amity_sdk/src/domain/model/amity_story_target.dart';
import 'package:amity_sdk/src/domain/usecase/story/get_targets_by_targets_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/story/story_target_observe_usercase.dart';

class StoryTargetLiveCollection extends LiveCollectionWithoutPagination<AmityStoryTarget>{
   RequestBuilder<GetTargetsByTargetsRequest> request;


   StoryTargetLiveCollection({required this.request});

  @override
  Future<List<AmityStoryTarget>> getData() async {
    return await serviceLocator<GetTargetByTargetsUsecase>().get(request());
  }

  @override
  StreamController<List<AmityStoryTarget>> getStreamController() {
    return serviceLocator<StoryTargetObserveUsecase>().listen(request);
  }

}