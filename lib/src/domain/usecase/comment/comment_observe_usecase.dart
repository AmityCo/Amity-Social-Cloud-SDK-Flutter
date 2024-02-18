import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CommentObserveUseCase extends UseCase<List<AmityComment>, GetCommentRequest> {
  final CommentRepo commentRepo;
  final CommentComposerUsecase commentComposerUsecase;

  CommentObserveUseCase(
      {required this.commentRepo, required this.commentComposerUsecase});

  @override
  Future<List<AmityComment>> get(params) {
    throw UnimplementedError();
  }

  StreamController<List<AmityComment>> listen(
      RequestBuilder<GetCommentRequest> request) {
    final streamController = StreamController<List<AmityComment>>();
    commentRepo.listenComments(request).listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await commentComposerUsecase.get(element);
      });
      streamController.add(event);
    });
    return streamController;
  }
}
