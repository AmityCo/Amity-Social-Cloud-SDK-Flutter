import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';

abstract class SubChannelDbAdapter{
    Future saveSubChannelEntity(SubChannelHiveEntity data);
    SubChannelHiveEntity? getSubChannelEntity(String id);
    Stream<List<SubChannelHiveEntity>> listenSubChannelEntities(
      RequestBuilder<GetSubChannelsRequest> request);
    Future deleteAll();
  Stream<SubChannelHiveEntity> listenSubChannelEntity(String id);
}