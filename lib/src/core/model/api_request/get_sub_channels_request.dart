import 'package:amity_sdk/src/core/core.dart';

class GetSubChannelsRequest{
  String? channelId;
  bool? excludeMainSubChannel = true;
  bool? isDeleted = false;
  OptionsRequest? options;

  GetSubChannelsRequest({this.channelId, this.excludeMainSubChannel, this.isDeleted, this.options});

  factory GetSubChannelsRequest.fromJson(Map<String, dynamic> json) => GetSubChannelsRequest(
    channelId: json["channelId"],
    excludeMainSubChannel: json["excludeDefaultMessageFeed"],
    isDeleted: json["isDeleted"],
    options: json["options"] == null ? null : OptionsRequest.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "excludeDefaultMessageFeed": excludeMainSubChannel,
    "isDeleted": isDeleted,
    "options": options?.toJson(),
  }..removeNullValue();
  
}