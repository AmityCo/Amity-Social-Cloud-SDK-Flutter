import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CommentFetchUseCase
    extends UseCase<PageListData<List<AmityComment>, String>, GetCommentRequest> {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  final CommentRepo commentRepo;

  CommentFetchUseCase(
      {required this.commentRepo});

  @override
  Future<PageListData<List<AmityComment>, String>> get(GetCommentRequest params) async {
    return commentRepo.queryComment(params);
  }
}
