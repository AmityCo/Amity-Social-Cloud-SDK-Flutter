import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/domain/model/sub_channel/amity_sub_channel.dart';

extension SubChannelHiveExtensionConverter on SubChannelHiveEntity {
  AmitySubChannel convertToSubChannel() {
    return AmitySubChannel(
      subChannelId: subChannelId ,
      channelId: channelId,
      channelPublicId: channelPublicId,
      channelType: AmityChannelTypeExtension.enumOf(channelType),
      messageCount: messageCount,
      isDeleted: isDeleted,
      latestMessageId: latestMessageId,
      lastActivity: lastActivity,
      creatorId: creatorId,
      creatorPublicId: creatorPublicId,
      displayName: name,
      editedAt: editedAt,
      path: path,
      messagePreviewId: messagePreviewId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  bool isMatchingFilter(GetSubChannelsRequest request) {
    return isMatchingChannel(request.channelId!);
  }


  bool isMatchingChannel(String channelId){

    print("channelId: $channelId == this.channelId: ${this.channelId}");
    return this.channelId == channelId || channelPublicId == channelId;
  }
}
