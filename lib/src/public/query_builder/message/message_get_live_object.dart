import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/message/message_live_object_usecase.dart';

class MessageGetLiveObject{
  Stream<AmityMessage> getMessage(String messageId){
    return MessageLiveObjectUseCase().execute(messageId);
  }
}