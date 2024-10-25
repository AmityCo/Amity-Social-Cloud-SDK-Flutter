import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelGetUsecase
    extends UseCase<PageListData<List<AmitySubChannel>, String>, GetSubChannelsRequest> {
  final SubChannelRepo subChannelRepo;
  SubChannelGetUsecase({required this.subChannelRepo,});

  @override
  Future<PageListData<List<AmitySubChannel>, String>> get(
      GetSubChannelsRequest params) async {
    final amitysubChannel = await subChannelRepo.querySubChannels(params);
    return amitysubChannel;
  }
}