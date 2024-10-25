import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/create_sub_channel_request.dart';
import 'package:amity_sdk/src/domain/model/sub_channel/amity_sub_channel.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelCreateUseCase extends UseCase<AmitySubChannel, CreateSubChannelRequest>{
  final SubChannelRepo subChannelRepo;
  SubChannelCreateUseCase({required this.subChannelRepo});
  @override
  Future<AmitySubChannel> get(CreateSubChannelRequest params) {
    return subChannelRepo.createSubChannel(params);
  }
  
}