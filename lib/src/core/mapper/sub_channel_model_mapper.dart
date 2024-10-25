import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/sub_channel/sub_channel_hive_extension_converter.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';

class SubChannelModelMapper extends ModelMapper<SubChannelHiveEntity, AmitySubChannel> {
  @override
  AmitySubChannel map(SubChannelHiveEntity entity) {
    return entity.convertToSubChannel();
  }
  

}