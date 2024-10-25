import 'package:amity_sdk/src/core/extension/extension.dart';

class DeleteSubChannelRequest{
  String subChannelId; 
  bool permanent;

  DeleteSubChannelRequest({required this.subChannelId, required this.permanent});

  factory DeleteSubChannelRequest.fromJson(Map<String, dynamic> json) => DeleteSubChannelRequest(
    subChannelId: json["subChannelId"],
    permanent: json["permanent"],
  );

  Map<String, dynamic> toJson() => {
    "subChannelId": subChannelId,
    "permanent": permanent,
  }..removeNullValue();

  
}