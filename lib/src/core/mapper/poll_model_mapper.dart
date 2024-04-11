import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

class PollModelMapper extends ModelMapper<PollHiveEntity, AmityPoll>{
  @override
  AmityPoll map(PollHiveEntity entity) {
    return entity.convertToAmityPoll();
  }
  
}