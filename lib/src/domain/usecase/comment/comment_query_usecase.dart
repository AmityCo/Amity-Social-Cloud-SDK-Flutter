import 'dart:developer';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CommentQueryUseCase
    extends UseCase<PageListData<List<AmityComment>, String>, GetCommentRequest> {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  final CommentRepo commentRepo;
  final CommentComposerUsecase commentComposerUsecase;

  CommentQueryUseCase(
      {required this.commentRepo, required this.commentComposerUsecase});

  @override
  Future<PageListData<List<AmityComment>, String>> get(GetCommentRequest params) async {
    final amityComment = await commentRepo.queryComment(params);
    final amityComposedComment = await Stream.fromIterable(amityComment.data)
        .asyncMap((event) => commentComposerUsecase.get(event))
        .toList();
    return amityComment.withItem1(amityComposedComment);
  }
}
