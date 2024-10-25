import 'package:amity_sdk/src/data/response/core_response/sub_channel_response.dart';
import 'package:amity_sdk/src/data/response/response.dart';
import 'package:amity_sdk/src/domain/model/sub_channel/amity_sub_channel.dart';

class CreateSubChannelResponse{

  final List<SubChannelResponse> subChannels;
  
  final List<UserResponse> users;

  final List<MessageResponse> messages;

  final PagingResponse? paging;

  CreateSubChannelResponse({
    required this.subChannels,
    required this.users,
    required this.messages,
    this.paging,
  });

  factory CreateSubChannelResponse.fromJson(Map<String, dynamic> json) =>
      CreateSubChannelResponse(
        subChannels: List<SubChannelResponse>.from(
            json["messageFeeds"].map((x) => SubChannelResponse.fromJson(x))),
        users: List<UserResponse>.from(
            json["users"].map((x) => UserResponse.fromJson(x))),
        messages:json["messages"]!=null ? List<MessageResponse>.from(
            json["messages"].map((x) => MessageResponse.fromJson(x))) : [],
        paging: json["paging"] == null
            ? null
            : PagingResponse.fromJson(json["paging"]),
      );

  Map<String, dynamic> toJson() => {
        "messageFeeds": List<dynamic>.from(subChannels.map((x) => x.toJson())),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "paging": paging?.toJson(),
      };

}