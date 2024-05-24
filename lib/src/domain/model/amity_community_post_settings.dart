enum AmityCommunityPostSettings {
  ADMIN_CAN_POST_ONLY(onlyAdminCanPost: true, isPostReviewEnabled: false),
  ADMIN_REVIEW_POST_REQUIRED(
      onlyAdminCanPost: false, isPostReviewEnabled: true),
  ANYONE_CAN_POST(onlyAdminCanPost: false, isPostReviewEnabled: false);

  const AmityCommunityPostSettings(
      {required this.onlyAdminCanPost, required this.isPostReviewEnabled});
  final bool onlyAdminCanPost;
  final bool isPostReviewEnabled;

}

extension AmityCommunityPostSettingsExtension on AmityCommunityPostSettings {
  String get value {
    switch (this) {
      case AmityCommunityPostSettings.ADMIN_CAN_POST_ONLY:
        return 'ADMIN_CAN_POST_ONLY';
      case AmityCommunityPostSettings.ADMIN_REVIEW_POST_REQUIRED:
        return 'ADMIN_REVIEW_POST_REQUIRED';
      case AmityCommunityPostSettings.ANYONE_CAN_POST:
        return 'ANYONE_CAN_POST';
    }
  }

  static AmityCommunityPostSettings enumOf(String name) {
    switch (name) {
      case 'ADMIN_CAN_POST_ONLY':
        return AmityCommunityPostSettings.ADMIN_CAN_POST_ONLY;
      case 'ADMIN_REVIEW_POST_REQUIRED':
        return AmityCommunityPostSettings.ADMIN_REVIEW_POST_REQUIRED;
      default:
        return AmityCommunityPostSettings.ANYONE_CAN_POST;
    }
  }
}
