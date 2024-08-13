import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/usecase/channel/channel_observe_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/channel/channel_query_fetch_usecase.dart';

class ChannelLiveCollection extends LiveCollection<AmityChannel> {
  RequestBuilder<GetChannelRequest> request;

  ChannelLiveCollection({required this.request});

  @override
  Future<PageListData<List<AmityChannel>, String>>
      getFirstPageRequest() async {
    final params = request();
    params.options = OptionsRequest();
    params.options?.token = null;
    params.options?.limit = defaultPageSize;

    return await serviceLocator<ChannelQueryFetchUseCase>().get(params);
  }

  @override
  Future<PageListData<List<AmityChannel>, String>> getNextPageRequest(
      String? token) async {
    final params = request();
    params.options?.token = token;
    params.options?.limit = null;
    return await serviceLocator<ChannelQueryFetchUseCase>().get(params);
  }

  @override
  StreamController<List<AmityChannel>> getStreamController() {
    return serviceLocator<ChannelObserveUseCase>().listen(request);
  }
}
