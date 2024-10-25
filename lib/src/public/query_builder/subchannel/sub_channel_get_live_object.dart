import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/subchannel/sub_channel_live_object_usecase.dart';

class SubChannelGetLiveObject{
  Stream<AmitySubChannel> getSubChannel(String subChannelId){
    return SubChannelLiveObjectUseCase().execute(subChannelId);
  }
}