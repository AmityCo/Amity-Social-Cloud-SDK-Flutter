import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// GetReactionQueryBuilder
class GetReactionQueryBuilder {
  GetReactionUsecase _usecase;
  AmityReactionReferenceType _referenceType;
  String _referenceId;
  String? _reactionName;

  /// init [GetReactionQueryBuilder]
  GetReactionQueryBuilder(
      this._usecase, this._referenceType, this._referenceId);

  /// get reaction for Post
  factory GetReactionQueryBuilder.post({required String postId}) {
    return GetReactionQueryBuilder(
      serviceLocator<GetReactionUsecase>(),
      AmityReactionReferenceType.POST,
      postId,
    );
  }

  /// get reaction for Comment
  factory GetReactionQueryBuilder.comment({required String commentId}) {
    return GetReactionQueryBuilder(
      serviceLocator<GetReactionUsecase>(),
      AmityReactionReferenceType.COMMENT,
      commentId,
    );
  }

  /// get reaction for Message
  factory GetReactionQueryBuilder.message({required String messageId}) {
    return GetReactionQueryBuilder(
      serviceLocator<GetReactionUsecase>(),
      AmityReactionReferenceType.MESSAGE,
      messageId,
    );
  }

  /// get reaction for Story
  factory GetReactionQueryBuilder.story({required String storyId}) {
    return GetReactionQueryBuilder(
      serviceLocator<GetReactionUsecase>(),
      AmityReactionReferenceType.STORY,
      storyId,
    );
  }

  /// get reaction for Message
  factory GetReactionQueryBuilder.build(
      {required AmityReactionReference reactionReference}) {
    if (reactionReference.referenceType == AmityReactionReferenceType.POST) {
      return GetReactionQueryBuilder.post(
          postId: reactionReference.referenceId);
    } else if (reactionReference.referenceType ==
        AmityReactionReferenceType.STORY) {
      return GetReactionQueryBuilder.story(
          storyId: reactionReference.referenceId);
    } else if (reactionReference.referenceType ==
        AmityReactionReferenceType.COMMENT) {
      return GetReactionQueryBuilder.comment(
          commentId: reactionReference.referenceId);
    } else {
      return GetReactionQueryBuilder.message(
          messageId: reactionReference.referenceId);
    }
  }

  /// get reaction for Reaction name
  GetReactionQueryBuilder reactionName(String reactionName) {
    _reactionName = reactionName;
    return this;
  }

  ReactionLiveCollection getLiveCollection({int? pageSize = 20}) {
    return ReactionLiveCollection(request: (() => build(pageSize: pageSize)));
  }

  GetReactionRequest build({int? pageSize = 20}) {
    GetReactionRequest getReactionRequest = GetReactionRequest(
      referenceId: _referenceId,
      referenceType: _referenceType.value,
      reactionName: _reactionName,
    );

    OptionsRequest options = OptionsRequest();
    getReactionRequest.options = options;
    options.type = 'pagination'; //Default option
    getReactionRequest.options?.limit = pageSize;

    return getReactionRequest;
  }

  /* begin_public_function 
  id: reaction.query
  */
  /// Get Reaction pagging data
  Future<PageListData<List<AmityReaction>, String>> getPagingData(
      {String? token, int? limit}) async {
    final request = GetReactionRequest(
        referenceId: _referenceId, referenceType: _referenceType.value);
    if (_reactionName != null) request.reactionName = _reactionName;

    request.options = OptionsRequest();

    if (token != null) {
      request.options!.token = token;
    }
    if (limit != null) {
      request.options!.limit = limit;
    }

    final data = await _usecase.get(request);

    return data;
  }
  /* end_public_function */
}
