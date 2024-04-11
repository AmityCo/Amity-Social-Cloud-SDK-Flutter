import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/community/community_live_object_usecase.dart';

class CommunityGetLiveObject {
  Stream<AmityCommunity> getCommunity(String communityId) {
    return CommunityLiveObjectUseCase().execute(communityId);
  }
}
