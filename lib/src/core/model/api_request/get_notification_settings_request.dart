import 'package:amity_sdk/src/core/extension/extension.dart';

class GetNotificationSettingsRequest{
  String? level;
  String? communityId;
  String? channelId;

  GetNotificationSettingsRequest({ this.level,  this.communityId,  this.channelId});

  factory GetNotificationSettingsRequest.fromJson(Map<String, dynamic> json) => GetNotificationSettingsRequest(
    level: json["level"],
    communityId: json["communityId"],
    channelId: json["channelId"],
  );

  Map<String, dynamic> toJson() => {
    "level": level,
    "communityId": communityId,
    "channelId": channelId,
  }..removeNullValue();
}