class CreateSubChannelRequest{
  String channelId;
  String name;

  CreateSubChannelRequest({
    required this.channelId,
    required this.name,
  });

  CreateSubChannelRequest.fromJson(Map<String, dynamic> json) :
    channelId = json['channelId'],
    name = json['name'];


  Map<String, dynamic> toJson() { 
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channelId'] = channelId;
    data['name'] = name;
    return data;
  }
}