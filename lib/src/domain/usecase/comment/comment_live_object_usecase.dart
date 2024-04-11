import 'package:amity_sdk/src/core/enum/tombstone_type.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class CommentLiveObjectUseCase extends LiveObjectUseCase<CommentHiveEntity , AmityComment>{
  
  @override
  AmityComment? composeModel(AmityComment model)  {
    serviceLocator<CommentComposerUsecase>().get(model).then((value){
      return value;
    });
    
  }

  @override
  AmityObjectRepository<CommentHiveEntity, AmityComment> createRepository() {
     return serviceLocator<CommentRepo>() as AmityObjectRepository<CommentHiveEntity, AmityComment>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.COMMENT;
  }

}