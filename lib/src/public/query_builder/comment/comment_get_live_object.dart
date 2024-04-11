import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/comment/comment_live_object_usecase.dart';

class CommentGetLiveObject{

  Stream<AmityComment> getComment(String commentId){
    return CommentLiveObjectUseCase().execute(commentId);
  }
}