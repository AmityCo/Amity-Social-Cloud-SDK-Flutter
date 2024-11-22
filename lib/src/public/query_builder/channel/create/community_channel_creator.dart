import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';

class CommunityChannelCreator {


  @Deprecated("custom channelId will be removed in future release, channel will be created with random channelId instead")
  ChannelCreatorBuilder withChannelId(String channelId) {
    return ChannelCreatorBuilder(serviceLocator(), AmityChannelType.COMMUNITY)
      ..channelId(channelId);
  }

  ChannelCreatorBuilder withDisplayName(String displayName) {
    return ChannelCreatorBuilder(serviceLocator(), AmityChannelType.COMMUNITY)
      ..displayName(displayName);
  }
}
