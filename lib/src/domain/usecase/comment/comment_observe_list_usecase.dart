import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

class CommentObserveListUseCase
    extends ObserverUseCase<List<AmityComment>, GetCommentRequest> {
  final CommentRepo commentRepo;
  final PagingIdRepo pagingIdRepo;
  final CommentComposerUsecase commentComposerUsecase;

  CommentObserveListUseCase(
      {required this.commentRepo,
      required this.pagingIdRepo,
      required this.commentComposerUsecase});

  @override
  StreamController<List<AmityComment>> listen(
      RequestBuilder<GetCommentRequest> request) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    final streamController = StreamController<List<AmityComment>>();
    commentRepo.listenComments(request).listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetCommentRequest> request,
  ) async {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;

    if (streamController.isClosed) {
      return;
    }
    final commentEntities = commentRepo.getCommentEntities(request);

    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    pagingIds.sort((a, b) => (a.position ?? 0).compareTo(b.position ?? 0));
    if (commentEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityComment>[]);
    } else {
      final commentIds = pagingIds.map((e) => e.id).toList();
      final comments = commentEntities
          .where((comment) => commentIds.contains(comment.commentId))
          .map((e) => e.convertToAmityComment())
          .toList()
        ..sort((a, b) => (b.createdAt ?? DateTime.now())
            .compareTo(a.createdAt ?? DateTime.now()));
      await Stream.fromIterable(comments).forEach((element) async {
        element = await commentComposerUsecase.get(element);
      });
      if (!streamController.isClosed) {
        streamController.add(comments);
      }
    }
  }
}
