import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';

/// [ChannelDbAdapter]
abstract class ChannelDbAdapter {
  /// Save  Entity
  Future saveEntity(ChannelHiveEntity data);

  /// Delete  Entity
  Future deleteEntity(ChannelHiveEntity data);

  /// get  entity with  ID
  ChannelHiveEntity getEntity(String id);

  /// Listen entity with  id
  Stream<ChannelHiveEntity> listenEntity(String id);

  /// Listen to channel entities caches
  Stream<List<ChannelHiveEntity>> listenChannelEntities(
      RequestBuilder<GetChannelRequest> request);

  /// get channel entities caches
  List<ChannelHiveEntity> getChannelEntities(
      RequestBuilder<GetChannelRequest> request);

  // /// Listen Message Entities
  // Stream<List<ChannelHiveEntity>> listenMessageEntities(
  //     MessageQueryRequest request);

  // /// delete all message with in the channel
  // Future deleteMessagesByChannelId(String channelId);

}
