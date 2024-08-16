import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [ChannelCreateUsecase]
class ChannelUpdateLastActivityUsecase extends ProcessingUseCase<String, String> {
  /// Channel Repo
  final ChannelRepo channelRepo;

  /// Init [ChannelUpdateLastActivityUsecase]
  ChannelUpdateLastActivityUsecase({required this.channelRepo});

  @override
  Future<String> process(String channelId) async {
    final channel = channelRepo.getChannelEntity(channelId);
    if (channel != null) {
      channel.lastActivity = DateTime.now();
      await channelRepo.saveChannelEntity(channel);
    }
    return channelId;
  }
}
