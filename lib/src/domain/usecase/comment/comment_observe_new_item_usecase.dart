import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

class CommentObserveNewItemUseCase
    extends ObserverUseCase<PagingIdHiveEntity, GetCommentRequest> {
  /// Comment Repo
  final CommentRepo commentRepo;
  final PagingIdRepo pagingIdRepo;
  HashMap<String, bool> commentIdMap = HashMap();

  CommentObserveNewItemUseCase(
      {required this.commentRepo, required this.pagingIdRepo});

  @override
  StreamController<PagingIdHiveEntity> listen(RequestBuilder<GetCommentRequest> request) {
    final streamController = StreamController<PagingIdHiveEntity>();
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    pagingIdRepo.listenPagingIdEntities(nonce,hash).listen((event) async {
      _onChanges(streamController, request);
    });
    commentRepo.listenComments(request).listen((event) async {
      _onChanges(streamController, request);
    });
    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetCommentRequest> request,
  ) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    var firstPosition = 0;
    if (streamController.isClosed) {
      return;
    }
    final commentEntities = commentRepo.getCommentEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (pagingIds.isNotEmpty){
      firstPosition = pagingIds.map( 
        (e) => e.position ?? 0
      ).reduce(min);
    }
    if (commentEntities.isNotEmpty) {
      final commentIds = pagingIds.map((e) => e.id).toList();                                                                                                                                                                                                                
      final unsyncEntities = commentEntities.where((comment) => !commentIds.contains(comment.commentId)).toList();
      unsyncEntities.sort((a, b) => (a.createdAt ?? DateTime.now()).compareTo((b.createdAt ?? DateTime.now())));
      unsyncEntities.forEachIndexed((index, comment) {
        final commentId = comment.commentId;
        if (commentId != null) {
          final pagingId = PagingIdHiveEntity(
            id: commentId,
            hash: hash,
            nonce: nonce,
            position: firstPosition - (index + 1),
          );
          if (!streamController.isClosed) {
            commentIdMap[commentId] = true;
            streamController.add(pagingId);
          }
        }
      });
    }
  }
}
