import 'dart:core';

import 'package:amity_sdk/src/core/extension/extension.dart';
import 'package:amity_sdk/src/core/model/api_request/notifiable_events_request.dart';

sealed class NotificationSaveSettingsRequest {
  Map<String, dynamic> toJson();
}

class ChannelNotificationSettings extends NotificationSaveSettingsRequest {
  String? channelId;
  bool? isPushNotifiable = false;
  List<NotifiableEventsRequest>? notifiableEvents;
  String level = "channel";

  ChannelNotificationSettings(
      {this.channelId, 
      required this.isPushNotifiable,
      this.notifiableEvents,});

  @override
  Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "isPushNotifiable": isPushNotifiable,
        "level": level
      }..removeNullValue();
}

class CommunityNotificationSettings extends NotificationSaveSettingsRequest {
  String communityId;
  bool isPushNotifiable;
  List<NotifiableEventsRequest>? notifiableEvents;
  String level = "community";

  CommunityNotificationSettings(
      {required this.communityId,
      required this.isPushNotifiable,
      this.notifiableEvents,});

  @override
  Map<String, dynamic> toJson() => {
        "communityId": communityId,
        "isPushNotifiable": isPushNotifiable,
        "notifiableEvents": notifiableEvents == null ? null : List<dynamic>.from(notifiableEvents!.map((x) => x.toJson())),
        "level": level
      }..removeNullValue();
}

class UserNotificationSettings extends NotificationSaveSettingsRequest {
  bool? isPushNotifiable = false;
  List<NotifiableEventsRequest>? notifiableModules;
  String level = "user";

  UserNotificationSettings({required this.isPushNotifiable, this.notifiableModules});

  @override
  Map<String, dynamic> toJson() => {
        "isPushNotifiable": isPushNotifiable,
        "notifiableEvents": notifiableModules == null ? null : List<dynamic>.from(notifiableModules!.map((x) => x.toJson())),
        "level": level
      }..removeNullValue();
}
