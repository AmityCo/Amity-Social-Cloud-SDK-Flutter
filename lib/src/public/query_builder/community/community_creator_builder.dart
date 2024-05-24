import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_community_post_settings.dart';
import 'package:amity_sdk/src/domain/model/amity_community_story_settings.dart';

/// [CommunityCreatorBuilder]
class CommunityCreatorBuilder {
  final CommunityCreateUsecase usecase;
  final String _displayName;

  //Optional Params
  String? _description;
  bool? _isPublic = false;
  List<String>? _categoryIds;
  Map<String, dynamic>? _metadata;
  List<String>? _userIds;
  List<String>? _tags;
  String? _avatarFileId;
  // bool? _needApprovalOnPostCreation;
  AmityCommunityStorySettings? _storySettings;
  AmityCommunityPostSettings? _postSettings;

  /// init [CommunityCreatorBuilder]
  CommunityCreatorBuilder(this.usecase, this._displayName);

  CommunityCreatorBuilder description(String description) {
    _description = description;
    return this;
  }

  CommunityCreatorBuilder isPublic(bool isPublic) {
    _isPublic = isPublic;
    return this;
  }

  CommunityCreatorBuilder categoryIds(List<String> categoryIds) {
    _categoryIds = categoryIds;
    return this;
  }

  CommunityCreatorBuilder metadata(Map<String, dynamic> metadata) {
    _metadata = metadata;
    return this;
  }

  CommunityCreatorBuilder userIds(List<String> userIds) {
    _userIds = userIds;
    return this;
  }


  CommunityCreatorBuilder storySettings(AmityCommunityStorySettings settings) {
    _storySettings = settings;
    return this;
  }

  CommunityCreatorBuilder tags(List<String> tags) {
    _tags = tags;
    return this;
  }

  CommunityCreatorBuilder avatar(AmityImage avatar) {
    _avatarFileId = avatar.fileId;
    return this;
  }

  // CommunityCreatorBuilder isPostReviewEnabled(bool isPostReviewEnabled) {
  //   _needApprovalOnPostCreation = isPostReviewEnabled;
  //   return this;
  // }

  CommunityCreatorBuilder postSetting(AmityCommunityPostSettings settings) {
    _postSettings = settings;
    return this;
  }

  Future<AmityCommunity> create() async {
    CreateCommunityRequest request = CreateCommunityRequest();
    request.displayName = _displayName;
    request.description = _description;
    request.isPublic = _isPublic;
    request.categoryIds = _categoryIds;
    request.metadata = _metadata;
    request.userIds = _userIds;
    request.tags = _tags;
    request.allowCommentInStory = _storySettings?.allowComment ;
    request.avatarFileId = _avatarFileId;
    request.needApprovalOnPostCreation = _postSettings?.isPostReviewEnabled;
    request.onlyAdminCanPost = _postSettings?.onlyAdminCanPost;

    return usecase.get(request);
  }
}
