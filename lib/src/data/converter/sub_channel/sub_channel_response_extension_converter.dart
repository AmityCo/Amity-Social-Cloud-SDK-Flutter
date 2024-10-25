import 'package:amity_sdk/src/data/data_source/local/hive_entity/sub_channel_hive_entity_35.dart';
import 'package:amity_sdk/src/data/response/core_response/sub_channel_response.dart';
import 'package:amity_sdk/src/data/response/response.dart';

extension SubChannelResponseExtensionConverter on SubChannelResponse {
  // Convert to SubChannelHiveEntity
  SubChannelHiveEntity convertToSubChannelHiveEntity() {
    return SubChannelHiveEntity(
      subChannelId: subChannelId,
      channelId: channelId,
      channelPublicId: channelPublicId,
      networkId: networkId,
      channelType: channelType,
      name: name ,
      path: path,
      messageCount: childCount,
      isDeleted: isDeleted,
      latestMessageId: latestMessageId,
      lastActivity: lastActivity,
      creatorId: creatorId,
      creatorPublicId: creatorPublicId,
    );
  }
}
