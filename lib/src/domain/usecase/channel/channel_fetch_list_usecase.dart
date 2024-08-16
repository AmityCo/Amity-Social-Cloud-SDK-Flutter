import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [ChannelFetchListUseCase]
class ChannelFetchListUseCase extends UseCase<
    PageListData<List<AmityChannel>, String>, GetChannelRequest> {
  /// Channel Repo
  final ChannelRepo channelRepo;

  /// init [ChannelFetchListUseCase]
  ChannelFetchListUseCase({required this.channelRepo});
  
  @override
  Future<PageListData<List<AmityChannel>, String>> get(
      GetChannelRequest params) async {
    return channelRepo.getChannelQuery(params);
  }
}
