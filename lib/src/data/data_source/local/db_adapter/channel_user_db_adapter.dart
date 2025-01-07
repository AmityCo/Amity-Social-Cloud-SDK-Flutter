import 'package:amity_sdk/src/data/data.dart';

///[ChannelUserDbAdapter]
abstract class ChannelUserDbAdapter {
  /// Save  Entity
  Future saveEntity(ChannelUserHiveEntity data, UserHiveEntity? userEntity);

  /// Delete  Entity
  Future deleteEntity(ChannelUserHiveEntity data);

  /// get  entity with  ID
  ChannelUserHiveEntity? getEntity(String id);

  /// Listen entity with  id
  Stream<ChannelUserHiveEntity> listenEntity(String id);

  Future updateMembership(String channelId, String userId, String membership);

  List<ChannelUserHiveEntity> getMembers(String channelId);

  // /// Listen Message Entities
  // Stream<List<ChannelUserHiveEntity>> listenMessageEntities(
  //     MessageQueryRequest request);

  // /// delete all message with in the channel
  // Future deleteMessagesByChannelId(String channelId);

}
