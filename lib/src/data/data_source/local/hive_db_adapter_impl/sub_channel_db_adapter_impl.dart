import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/core/utils/live_collection.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/sub_channel_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:hive/hive.dart';

class SubChannelDbAdapterImpl extends SubChannelDbAdapter {
  final DBClient dbClient;
  late Box<SubChannelHiveEntity> box;

  SubChannelDbAdapterImpl({required this.dbClient});

  Future<SubChannelDbAdapter> init() async {
    Hive.registerAdapter(SubChannelHiveEntityAdapter(), override: true);
    box = await Hive.openBox<SubChannelHiveEntity>('subchannel_db');
    return this;
  }
  
  @override
  Future saveSubChannelEntity(SubChannelHiveEntity data) {
    return box.put(data.subChannelId, data);
  }
  
  @override
  SubChannelHiveEntity? getSubChannelEntity(String id) {
    return box.get(id);
  }

  @override
  Stream<List<SubChannelHiveEntity>> listenSubChannelEntities(RequestBuilder<GetSubChannelsRequest> request) {
    return box.watch().map((event) => box.values
        .where((subchannel) => subchannel.isMatchingFilter(request.call())
            //missing tags
            )
        .toList());
  }
  
  @override
  Stream<SubChannelHiveEntity> listenSubChannelEntity(String id) {
    return box.watch(key: id).map((event) => event.value);
  }
  
  @override
  Future deleteAll() {
    return box.clear();
  }


}