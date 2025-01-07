import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/user/user_live_object_usecase.dart';

class UserGetLiveObject{
  Stream<AmityUser> getUser(String userId){
    return UserLiveObjectUseCase().execute(userId);
  }
}