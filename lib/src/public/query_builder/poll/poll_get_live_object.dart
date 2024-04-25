import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/domain/usecase/poll/poll_live_object_usecase.dart';

class PollGetLiveObject{

  String pollId;

  PollGetLiveObject(this.pollId);

  Stream<AmityPoll> getPoll(){
    return PollLiveObjectUseCase().execute(pollId);
  }
  
}