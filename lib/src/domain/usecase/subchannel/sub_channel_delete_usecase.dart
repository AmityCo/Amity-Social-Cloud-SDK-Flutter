import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/sub_channel/delete_sub_channel_request.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelDeleteUseCase extends UseCase<bool, DeleteSubChannelRequest>{
  final SubChannelRepo subChannelRepo;

  SubChannelDeleteUseCase({required this.subChannelRepo});

  @override
  Future<bool> get(DeleteSubChannelRequest params) {
    return subChannelRepo.deleteSubChannelById(params);
  }

}