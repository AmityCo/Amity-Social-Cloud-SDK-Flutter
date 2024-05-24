enum AmityCommunityNotificationEventName{
  
    POST_CREATED("post.created"),
    POST_REACTED("post.reacted"),
    COMMENT_CREATED("comment.created"),
    COMMENT_REPLIED("comment.replied"),
    COMMENT_REACTED("comment.reacted"),
    STORY_CREATED("story.created"),
    STORY_REACTED("story.reacted"),
    STORY_COMMENT_CREATED("story-comment.created"),
    UNKNOWN_EVENT("unknown");


  final String value;

  const AmityCommunityNotificationEventName(this.value);
}

extension AmityCommunityNotificationEventNameExtension on AmityCommunityNotificationEventName{

  static const _map = {
    "post.created": AmityCommunityNotificationEventName.POST_CREATED,
    "post.reacted": AmityCommunityNotificationEventName.POST_REACTED,
    "comment.created": AmityCommunityNotificationEventName.COMMENT_CREATED,
    "comment.replied": AmityCommunityNotificationEventName.COMMENT_REPLIED,
    "comment.reacted": AmityCommunityNotificationEventName.COMMENT_REACTED,
    "story.created": AmityCommunityNotificationEventName.STORY_CREATED,
    "story.reacted": AmityCommunityNotificationEventName.STORY_REACTED,
    "story-comment.created": AmityCommunityNotificationEventName.STORY_COMMENT_CREATED,
    "unknown": AmityCommunityNotificationEventName.UNKNOWN_EVENT
  };

  static AmityCommunityNotificationEventName? fromValue(String value) => _map[value];

  String get value => this.value;
}