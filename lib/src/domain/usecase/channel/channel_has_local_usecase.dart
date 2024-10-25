import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class ChannelHasLocalUsecase extends SynchronousUseCase<bool, String> {
  final ChannelRepo channelRepo;
  // final CommunityComposerUsecase messageComposerUsecase;
  ChannelHasLocalUsecase({required this.channelRepo});

  @override
  bool get(String params) {
    return channelRepo.hasInLocal(params);
  }
}
