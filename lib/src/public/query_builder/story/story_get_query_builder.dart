import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_stories_by_target_request.dart';

class AmityStoryGetQueryBuilder {
  String? _targetId;
  String? _targetType;
  List<StoryTargetSearchInfo>? _targets;
  StoryOptionRequest? _options;

  AmityStoryGetQueryBuilder orderBy(AmityStorySortingOrder orderBy) {
    String order = "asc";

    if (orderBy == AmityStorySortingOrder.LAST_CREATED) {
      order = "desc";
    } else {
      order = "asc";
    }

    _options = StoryOptionRequest(sortBy: "createdAt", orderBy: order);
    return this;
  }


  AmityStoryGetQueryBuilder targetType( AmityStoryTargetType targetType) {
    _targetType = targetType.value;
    return this;
  }

  AmityStoryGetQueryBuilder targetId( String targetId) {
    _targetId = targetId;
    return this;
  }

  AmityStoryGetQueryBuilder targets(List<StoryTargetSearchInfo> targets){
    _targets = targets;
    return this;
  }



  GetStoriesByTragetRequest build() {
    return GetStoriesByTragetRequest(
        targetId: _targetId,
        targetType: _targetType,
        options: _options,
        targets: _targets);
  }
}
