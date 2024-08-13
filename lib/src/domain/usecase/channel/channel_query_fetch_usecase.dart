import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [ChannelQueryFetchUseCase]
class ChannelQueryFetchUseCase extends UseCase<
    PageListData<List<AmityChannel>, String>, GetChannelRequest> {
  /// Channel Repo
  final ChannelRepo channelRepo;

  /// init [ChannelQueryFetchUseCase]
  ChannelQueryFetchUseCase({required this.channelRepo});
  
  @override
  Future<PageListData<List<AmityChannel>, String>> get(
      GetChannelRequest params) async {
    return channelRepo.getChannelQuery(params);
  }
}
