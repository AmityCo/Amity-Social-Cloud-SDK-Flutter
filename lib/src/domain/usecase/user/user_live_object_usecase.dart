import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class UserLiveObjectUseCase  extends LiveObjectUseCase<UserHiveEntity , AmityUser>{
  @override
  AmityUser? composeModel(AmityUser model) {
    return model;
  }

  @override
  AmityObjectRepository<UserHiveEntity, AmityUser> createRepository() {
      return serviceLocator<UserRepo>() as AmityObjectRepository<UserHiveEntity, AmityUser>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.USER;
  }

}