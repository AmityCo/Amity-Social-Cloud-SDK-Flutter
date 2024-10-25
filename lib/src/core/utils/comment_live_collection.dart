import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/usecase/comment/comment_observe_usecase.dart';

class CommentLiveCollection extends LiveCollection<AmityComment> {
  RequestBuilder<GetCommentRequest> request;

  CommentLiveCollection({required this.request});

  @override
  Future<PageListData<List<AmityComment>, String>> getFirstPageRequest() async {
    final params = request();
    params.options?.token = null;
    params.options?.limit = defaultPageSize;
    return await serviceLocator<CommentQueryUseCase>().get(params);
  }

  @override
  Future<PageListData<List<AmityComment>, String>> getNextPageRequest(
      String? token) async {
    final params = request();
    params.options?.token = token;
    params.options?.limit = null;
    return await serviceLocator<CommentQueryUseCase>().get(params);
  }

  @override
  StreamController<List<AmityComment>> getStreamController() {
    return serviceLocator<CommentObserveUseCase>().listen(request);
  }
}