import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/update_sub_channel_request.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelUpdateUseCase extends UseCase<AmitySubChannel, UpdateSubChannelRequest>{
  final SubChannelRepo subChannelRepo;

  SubChannelUpdateUseCase({required this.subChannelRepo});

  @override
  Future<AmitySubChannel> get(UpdateSubChannelRequest params) {
    return subChannelRepo.updateSubChannel(params);
  }

}