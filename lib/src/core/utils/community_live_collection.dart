import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/usecase/community/community_fetch_list_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/community/community_observe_list_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/community/community_observe_new_item_usecase.dart';

class CommunityLiveCollection extends LiveCollection<AmityCommunity> {
  RequestBuilder<GetCommunityRequest> request;

  CommunityLiveCollection({required this.request});

  @override
  AmityNonce getNonce() {
    return request().getNonce();
  }

  @override
  int getHash() {
    return request().getHashCode();
  }

  @override
  Future<PageListData<List<AmityCommunity>, String>>
      getFirstPageRequest() async {
    final params = request();
    params.options?.token = null;
    return await serviceLocator<CommunityFetchListUseCase>().get(params);
  }

  @override
  Future<PageListData<List<AmityCommunity>, String>> getNextPageRequest(
      String? token) async {
    final params = request();
    params.options?.token = token;
    params.options?.limit = null;
    return await serviceLocator<CommunityFetchListUseCase>().get(params);
  }

  @override
  StreamController<List<AmityCommunity>> getStreamController() {
    return serviceLocator<CommunityObserveListUseCase>().listen(request);
  }

  @override
  StreamController<PagingIdHiveEntity> observeNewItem() {
    return serviceLocator<CommunityObserveNewItemUsecase>().listen(request);
  }
}
