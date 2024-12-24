import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/channel/channel_live_object_usecase.dart';

class ChannelGetLiveObject{
  Stream<AmityChannel> getSubChannel(String channelId){
    return ChannelLiveObjectUseCase().execute(channelId);
  }
}