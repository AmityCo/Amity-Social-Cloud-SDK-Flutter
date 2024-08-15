import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/enum/tombstone_type.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';
import 'package:amity_sdk/src/core/usercase/live_object_usecase.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

class CommunityLiveObjectUseCase
    extends LiveObjectUseCase<CommunityHiveEntity, AmityCommunity> {
  @override
  AmityCommunity? composeModel(AmityCommunity model) {
    serviceLocator<CommunityComposerUsecase>().get(model).then((value) {
      return value;
    });
  }

  @override
  AmityObjectRepository<CommunityHiveEntity, AmityCommunity>
      createRepository() {
    return serviceLocator<CommunityRepo>()
        as AmityObjectRepository<CommunityHiveEntity, AmityCommunity>;
  }

  @override
  TombstoneModelType tombstoneModelType() {
    return TombstoneModelType.COMMUNITY;
  }
}
