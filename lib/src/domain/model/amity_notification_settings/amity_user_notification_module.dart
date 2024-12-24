import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/amity_community_notification_event_name.dart';

sealed class AmityUserNotificationModule {
  bool isEnabled;
  AmityRolesFilter rolesFilter;

  AmityUserNotificationModule({
    required this.isEnabled,
    required this.rolesFilter,
  });
}

class Chat extends AmityUserNotificationModule {
  Chat({
    required super.isEnabled,
    required super.rolesFilter,
  });
  static UserNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.CHAT, true, rolesFilter);
  }

  static UserNotificationModifier disable() {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.CHAT, false, null);
  }
}

class Social extends AmityUserNotificationModule {
  Social({
    required super.isEnabled,
    required super.rolesFilter,
  });
  static UserNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.SOCIAL, true, rolesFilter);
  }

  static UserNotificationModifier disable() {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.SOCIAL, false, null);
  }
}

class VideoStreaming extends AmityUserNotificationModule {
  VideoStreaming({
    required super.isEnabled,
    required super.rolesFilter,
  });

  static UserNotificationModifier enable(AmityRolesFilter? rolesFilter) {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.VIDEO_STREAMING, true, rolesFilter);
  }

  static UserNotificationModifier disable() {
    return UserNotificationModifier(
        AmityUserNotificationModuleName.VIDEO_STREAMING, false, null);
  }
}

class UserNotificationModifier {
  AmityUserNotificationModuleName eventName;
  bool isEnabled;
  AmityRolesFilter? rolesFilter;
  AmityRoles? includedRoles;
  AmityRoles? excludedRoles;

  UserNotificationModifier(
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
