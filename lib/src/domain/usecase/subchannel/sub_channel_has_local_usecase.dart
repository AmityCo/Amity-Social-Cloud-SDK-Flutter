import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelHasLocalUseCase extends SynchronousUseCase<bool, String>{
  final SubChannelRepo subChannelRepo;
  SubChannelHasLocalUseCase( {required this.subChannelRepo});
  
  @override
  bool get(String params) {
    return  subChannelRepo.hasLocalSubChannel(params);
  }
}