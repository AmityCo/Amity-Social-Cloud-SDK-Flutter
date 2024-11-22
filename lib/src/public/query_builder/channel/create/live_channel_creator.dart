import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/public/public.dart';

class LiveChannelCreator {

  @Deprecated("custom channelId will be removed in future release, channel will be created with random channelId instead")
  ChannelCreatorBuilder withChannelId(String channelId) {
    return ChannelCreatorBuilder(serviceLocator(), AmityChannelType.LIVE)
      ..channelId(channelId);
  }

  ChannelCreatorBuilder withDisplayName(String displayName) {
    return ChannelCreatorBuilder(serviceLocator(), AmityChannelType.LIVE)
      ..displayName(displayName);
  }
}
