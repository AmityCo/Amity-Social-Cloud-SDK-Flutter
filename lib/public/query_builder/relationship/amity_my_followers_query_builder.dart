import 'package:amity_sdk/core/enum/amity_follow_status_filter.dart';
import 'package:amity_sdk/domain/model/amity_follow_relationship.dart';
import 'package:amity_sdk/domain/usecase/relationship/get_my_followers_usecase.dart';

class AmityMyFollowersQueryBuilder {
  late GetMyFollowersUsecase _useCase;
  AmityFollowStatusFilter _status = AmityFollowStatusFilter.ALL;

  AmityMyFollowersQueryBuilder({required GetMyFollowersUsecase useCase}) {
    _useCase = useCase;
  }

  AmityMyFollowersQueryBuilder status(AmityFollowStatusFilter status) {
    _status = status;
    return this;
  }

  Future<List<AmityFollowRelationship>> query() {
    return _useCase.get();
  }
}
