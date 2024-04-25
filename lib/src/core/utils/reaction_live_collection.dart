import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/usecase/reaction/reaction_observe_usecase.dart';
import 'package:amity_sdk/src/domain/usecase/reaction/reaction_query_usecase.dart';

class ReactionLiveCollection extends LiveCollection<AmityReaction> {
  RequestBuilder<GetReactionRequest> request;

  ReactionLiveCollection({required this.request});

  @override
  Future<PageListData<List<AmityReaction>, String>> getFirstPageRequest() async {
    final params = request();
    params.options?.token = null;
    return await serviceLocator<ReactionQueryUsecase>().get(params);
  }

  @override
  Future<PageListData<List<AmityReaction>, String>> getNextPageRequest(
      String? token) async {
    final params = request();
    params.options?.token = token;
    params.options?.limit = null;
    return await serviceLocator<ReactionQueryUsecase>().get(params);
  }

  @override
  StreamController<List<AmityReaction>> getStreamController() {
    return serviceLocator<ReactionObserveUseCase>().listen(request);
  }
}