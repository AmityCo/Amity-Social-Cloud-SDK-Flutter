import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

abstract class CommentRepo extends AmityObjectRepository<CommentHiveEntity, AmityComment> {
  Future<AmityComment?> getCommentByIdFromDb(String commentId);

  Future<AmityComment> createComment(CreateCommentRequest request);
  Future<PageListData<List<AmityComment>, String>> queryComment(GetCommentRequest request);
  Future<PageListData<List<AmityComment>, String>> queryCommentPagingData(
      GetCommentRequest request);
  Stream<List<AmityComment>> listenComments(RequestBuilder<GetCommentRequest> request);

  Future<AmityComment> getComment(String commentId);
  Future<AmityComment> updateComment(
      String commentId, UpdateCommentRequest request);
  Future<bool> deleteComment(String commentId);

  Future<bool> flagComment(String commentId);
  Future<bool> unflagComment(String commentId);
  Future<bool> isCommentFlagByMe(String commentId);

  /// Has Local Comment
  bool hasLocalComment(String commentId);

  List<CommentHiveEntity> getCommentEntities(
      RequestBuilder<GetCommentRequest> request);
}
