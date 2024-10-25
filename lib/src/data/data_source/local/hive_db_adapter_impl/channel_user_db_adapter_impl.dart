import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

/// [ChannelUserDbAdapterImpl]
class ChannelUserDbAdapterImpl extends ChannelUserDbAdapter {
  /// Db Client
  final DBClient dbClient;

  /// Box
  late Box<ChannelUserHiveEntity> box;

  /// init [ChannelUserDbAdapterImpl]
  ChannelUserDbAdapterImpl({required this.dbClient});

  /// Init [ChannelDbAdapterImpl]
  Future<ChannelUserDbAdapterImpl> init() async {
    Hive.registerAdapter(ChannelUserHiveEntityAdapter(), override: true);
    box = await Hive.openBox<ChannelUserHiveEntity>('channel_user_db');
    return this;
  }

  @override
  Future deleteEntity(ChannelUserHiveEntity data) async {
    box.delete(data.channelId);
  }

  @override
  ChannelUserHiveEntity? getEntity(String id) {
    return box.get(id);
  }

  @override
  Future updateMembership(String channelId, String userId, String membership) async {
    final entity = box.get("${channelId}_$userId");
    if (entity != null) {
      entity.membership = membership;
      await box.put("${channelId}_$userId", entity);
    }
  }

  @override
  Stream<ChannelUserHiveEntity> listenEntity(String id) {
    return box.watch(key: id).map((event) => event.value);
  }

  @override
  Future saveEntity(ChannelUserHiveEntity data, UserHiveEntity? userEntity) async {
     if (userEntity != null) {
      // Determine if the user is deleted from user entity
      data.isDeleted = userEntity.isDeleted;
    } else {
      // If no user entity is found, and the cache from the db is exists, use cache.isDeleted value
      final cache = await box.get(data.id);
      if (cache != null) {
        data.isDeleted = cache.isDeleted;
      }
    }
    box.put(data.id, data);
  }
}
