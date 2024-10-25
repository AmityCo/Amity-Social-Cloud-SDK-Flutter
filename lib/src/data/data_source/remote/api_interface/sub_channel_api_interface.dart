import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/data/response/response.dart';

abstract class SubChannelApiInterface{

  Future<CreateSubChannelResponse> createSubChannel(CreateSubChannelRequest request);
  
  Future<CreateSubChannelResponse> querySubChannels(GetSubChannelsRequest request);

  Future<CreateSubChannelResponse> getSubChannel(String subChannelId);

  Future<bool> deleteSubChannel(DeleteSubChannelRequest request);

  Future<CreateSubChannelResponse> updateSubChannel(UpdateSubChannelRequest request);

}