import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/converter/converter.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

class CommentModelMapper extends ModelMapper<CommentHiveEntity, AmityComment>{
  @override
  AmityComment map(CommentHiveEntity entity) {
    return entity.convertToAmityComment();
  }
  
}