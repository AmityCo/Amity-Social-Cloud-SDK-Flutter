import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/amity_community_notification_event_name.dart';
import 'package:amity_sdk/src/data/response/get_notification_settings_response.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_channel_notification_settings.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_module.dart';
import 'package:amity_sdk/src/domain/model/amity_notification_settings/amity_user_notification_settings.dart';
import 'package:amity_sdk/src/src.dart';

class PushNotificationMapper {

  AmityUserNotificationSettings mapToUserNotificationSettings(
      GetNotificationSettingsResponse getNotificationSettingsResponse) {
    return AmityUserNotificationSettings(
        isEnabled: getNotificationSettingsResponse.isPushNotifiable ?? false,
        events: (getNotificationSettingsResponse.notifiableEvents == null)
            ? []
            : mapUserModules(
                getNotificationSettingsResponse.notifiableEvents!));
  }

  List<AmityUserNotificationModule> mapUserModules(
      List<NotifiableEvents> modules) {
    List<AmityUserNotificationModule> userModules = [];

    for (NotifiableEvents module in modules) {
      if (module.moduleName != null) {
        switch (AmityUserNotificationModuleNameExtension.fromValue(
            module.moduleName!)) {
          case AmityUserNotificationModuleName.CHAT:
            userModules.add(Chat(
                isEnabled: module.isPushNotifiable!,
                rolesFilter: mapRolesFilter(
                    module.listenFromRoleIds, module.ignoreFromRoleIds)));
            break;
          case AmityUserNotificationModuleName.SOCIAL:
            userModules.add(Social(
                isEnabled: module.isPushNotifiable!,
                rolesFilter: mapRolesFilter(
                    module.listenFromRoleIds, module.ignoreFromRoleIds)));
            break;
          case AmityUserNotificationModuleName.VIDEO_STREAMING:
            userModules.add(VideoStreaming(
                isEnabled: module.isPushNotifiable!,
                rolesFilter: mapRolesFilter(
                    module.listenFromRoleIds, module.ignoreFromRoleIds)));
            break;
          default:
          break;
        }
      }
    }

    return userModules;
  }

  AmityCommunityNotificationSettings mapToCommunityNotificationSettings(
      GetNotificationSettingsResponse getNotificationSettingsResponse) {
    return AmityCommunityNotificationSettings(
        isEnabled: getNotificationSettingsResponse.isPushNotifiable ?? false,
        events: (getNotificationSettingsResponse.notifiableEvents == null)
            ? []
            : mapCommunityEvents(
                getNotificationSettingsResponse.notifiableEvents!));
  }

  List<AmityCommunityNotificationEvent> mapCommunityEvents(
      List<NotifiableEvents> events) {
    List<AmityCommunityNotificationEvent> communityEvents = [];

    for (NotifiableEvents event in events) {
      if (event.name != null) {
        switch (AmityCommunityNotificationEventNameExtension.fromValue(
            event.name!)) {
          case AmityCommunityNotificationEventName.STORY_CREATED:
            communityEvents.add(StoryCreated(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;
          case AmityCommunityNotificationEventName.STORY_COMMENT_CREATED:
            communityEvents.add(StoryCommentCreated(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;
          case AmityCommunityNotificationEventName.STORY_REACTED:
            communityEvents.add(StoryReacted(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;
          case AmityCommunityNotificationEventName.POST_CREATED:
            communityEvents.add(PostCreated(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;

            case AmityCommunityNotificationEventName.POST_REACTED:
            communityEvents.add(PostReacted(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;

            case AmityCommunityNotificationEventName.COMMENT_CREATED:
            communityEvents.add(CommentCreated(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;

            case AmityCommunityNotificationEventName.COMMENT_REACTED:
            communityEvents.add(CommentReacted(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;
            case AmityCommunityNotificationEventName.COMMENT_REPLIED:
            communityEvents.add(CommentReplied(
                isEnabled: event.isPushNotifiable!,
                isNetworkEnabled: event.isNetworkEnabled!,
                rolesFilter: mapRolesFilter(
                    event.listenFromRoleIds, event.ignoreFromRoleIds)));
            break;
          default:
          break;
        }
      }
    }

    return communityEvents;
  }

  AmityChannelNotificationSettings mapToChannelNotificationSettings(
      GetNotificationSettingsResponse getNotificationSettingsResponse) {
    return AmityChannelNotificationSettings(
      isEnabled: getNotificationSettingsResponse.isPushNotifiable ?? false,
    );
  }

  AmityRolesFilter mapRolesFilter(
      List<String>? includedRoles, List<String>? excludedRoles) {
    if (includedRoles == null && excludedRoles == null) {
      return All();
    }

    if (includedRoles!.isEmpty && excludedRoles!.isEmpty) {
      return All();
    } else if (includedRoles.isNotEmpty) {
      return Only(AmityRoles(roles: includedRoles));
    } else {
      return Not(AmityRoles(roles: excludedRoles));
    }
  }
}
