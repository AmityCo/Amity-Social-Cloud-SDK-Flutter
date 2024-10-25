 import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

abstract class SubChannelRepo extends AmityObjectRepository<SubChannelHiveEntity, AmitySubChannel> {
  Future<AmitySubChannel> createSubChannel(CreateSubChannelRequest request);
  Future<PageListData<List<AmitySubChannel>, String>> querySubChannels(GetSubChannelsRequest request);
  Future<AmitySubChannel> getSubChannel(String subChannelId);
  Future<bool> deleteSubChannelById(DeleteSubChannelRequest request);
  Future<AmitySubChannel> updateSubChannel(UpdateSubChannelRequest request);
  bool hasLocalSubChannel(String subChannelId);
  Stream<List<AmitySubChannel>> listenPosts(RequestBuilder<GetSubChannelsRequest> request);



  
}