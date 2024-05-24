import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/amity_community_notification_event_name.dart';

sealed class AmityCommunityNotificationEvent {
  bool isEnabled;
  bool isNetworkEnabled;
  AmityRolesFilter rolesFilter;

  AmityCommunityNotificationEvent({
    required this.isEnabled,
    required this.isNetworkEnabled,
    required this.rolesFilter,
  });
}

class PostCreated extends AmityCommunityNotificationEvent {
  PostCreated({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });
  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.POST_CREATED, true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.POST_CREATED, false, null);
  }
}

class StoryCreated extends AmityCommunityNotificationEvent {
  StoryCreated({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });
  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.STORY_CREATED, true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.STORY_CREATED, false, null);
  }
}

class StoryReacted extends AmityCommunityNotificationEvent {
  StoryReacted({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.STORY_REACTED, true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.STORY_REACTED, false, null);
  }
}

class StoryCommentCreated extends AmityCommunityNotificationEvent {
  StoryCommentCreated({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(AmityCommunityNotificationEventName.STORY_COMMENT_CREATED,
        true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.STORY_COMMENT_CREATED, false, null);
  }
}


class PostReacted extends AmityCommunityNotificationEvent {
  PostReacted({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(AmityCommunityNotificationEventName.POST_REACTED,
        true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.POST_REACTED, false, null);
  }
}

class CommentReacted extends AmityCommunityNotificationEvent {
  CommentReacted({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(AmityCommunityNotificationEventName.COMMENT_REACTED,
        true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.COMMENT_REACTED, false, null);
  }
}


class CommentCreated extends AmityCommunityNotificationEvent {
  CommentCreated({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter ) {
    return CommunityNotificationModifier(AmityCommunityNotificationEventName.COMMENT_CREATED,
        true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.COMMENT_CREATED, false, null);
  }
}

class CommentReplied extends AmityCommunityNotificationEvent {
  CommentReplied({
    required super.isEnabled,
    required super.isNetworkEnabled,
    required super.rolesFilter,
  });

  static CommunityNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return CommunityNotificationModifier(AmityCommunityNotificationEventName.COMMENT_REPLIED,
        true, rolesFilter);
  }

  static CommunityNotificationModifier disable() {
    return CommunityNotificationModifier(
        AmityCommunityNotificationEventName.COMMENT_REPLIED, false, null);
  }
}




class CommunityNotificationModifier {
  AmityCommunityNotificationEventName eventName;
  bool isEnabled;
  AmityRolesFilter? rolesFilter;
  AmityRoles? includedRoles;
  AmityRoles? excludedRoles;

  CommunityNotificationModifier(
    this.eventName,
    this.isEnabled,
    this.rolesFilter,
  ) {
    if (rolesFilter is Only) {
      includedRoles = (rolesFilter as Only).getRoles();
    } else if (rolesFilter is Not) {
      excludedRoles = (rolesFilter as Not).getRoles();
    } else {
      includedRoles = AmityRoles();
    }
  }
}
