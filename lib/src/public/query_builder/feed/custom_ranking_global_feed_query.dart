import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_custom_rank_feed_request.dart';
import 'package:amity_sdk/src/domain/usecase/feed/get_custom_ranking_usecase.dart';

class AmityCustomRankingGlobalFeedQuery{
  final GetCustomRankingUseCase _usecase;

  AmityCustomRankingGlobalFeedQuery(this._usecase); 

  Future<PageListData<List<AmityPost>, String>> getPagingData(
      {String? token, int? limit}) async {
    GetCustomRankFeedRequest request = GetCustomRankFeedRequest();

    if (token != null) {
      request.token = token;
    }
    if (limit != null) {
      request.limit = limit;
    }

    final data = await _usecase.get(request);

    return data;
  }

  CustomRankingLiveCollection getLiveCollection() {
    return CustomRankingLiveCollection(request: () => GetCustomRankFeedRequest());
  }


}