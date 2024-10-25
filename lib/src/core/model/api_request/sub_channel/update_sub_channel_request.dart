import 'package:amity_sdk/src/core/extension/extension.dart';

class UpdateSubChannelRequest{
  String subChannelId; 
  String name;

  UpdateSubChannelRequest({
    required this.subChannelId,
    required this.name,
  });

  UpdateSubChannelRequest.fromJson(Map<String, dynamic> json) :
    subChannelId = json['subChannelId'],
    name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data..removeNullValue();
  }
}