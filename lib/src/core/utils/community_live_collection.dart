import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/usecase/community/community_observe_usecase.dart';

class CommunityLiveCollection extends LiveCollection<AmityCommunity> {
  RequestBuilder<GetCommunityRequest> request;

  CommunityLiveCollection({required this.request});

  @override
  Future<PageListData<List<AmityCommunity>, String>>
      getFirstPageRequest() async {
    final params = request();
    params.options?.token = null;
    return await serviceLocator<CommunityGetUsecase>().get(params);
  }

  @override
  Future<PageListData<List<AmityCommunity>, String>> getNextPageRequest(
      String? token) async {
    final params = request();
    params.options?.token = token;
    params.options?.limit = null;
    return await serviceLocator<CommunityGetUsecase>().get(params);
  }

  @override
  StreamController<List<AmityCommunity>> getStreamController() {
    return serviceLocator<CommunityObserveUseCase>().listen(request);
  }
}
