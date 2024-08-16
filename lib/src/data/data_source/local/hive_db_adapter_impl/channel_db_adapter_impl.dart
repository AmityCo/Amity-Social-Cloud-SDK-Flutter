import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/enum/amity_error.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:hive/hive.dart';

/// [ChannelDbAdapterImpl]
class ChannelDbAdapterImpl extends ChannelDbAdapter {
  /// Db Client
  final DBClient dbClient;

  /// Box
  late Box<ChannelHiveEntity> box;

  /// init [ChannelDbAdapterImpl]
  ChannelDbAdapterImpl({required this.dbClient});

  /// Init [ChannelDbAdapterImpl]
  Future<ChannelDbAdapterImpl> init() async {
    Hive.registerAdapter(ChannelHiveEntityAdapter(), override: true);
    box = await Hive.openBox<ChannelHiveEntity>('channel_db');
    return this;
  }

  @override
  Future deleteEntity(ChannelHiveEntity data) async {
    box.delete(data.channelId);
  }

  @override
  ChannelHiveEntity getEntity(String id) {
    try {
      return box.get(id)!;
    } catch (e) {
      throw AmityException(message: "", code: AmityError.ITEM_NOT_FOUND.code);
    }
  }

  @override
  Stream<ChannelHiveEntity> listenEntity(String id) {
    return box.watch(key: id).map((event) => event.value);
  }

  @override
  Future saveEntity(ChannelHiveEntity data) async {
    await box.put(data.channelId, data);
  }

  @override
  Stream<List<ChannelHiveEntity>> listenChannelEntities(
      RequestBuilder<GetChannelRequest> request) {
    return box.watch().map((event) => box.values
      .where((channel) => channel != null)
      .toList()
      ..sort((a, b) => (b.lastActivity ?? DateTime.now()).compareTo((a.lastActivity ?? DateTime.now()))));
    }

  @override
  List<ChannelHiveEntity> getChannelEntities(
      RequestBuilder<GetChannelRequest> request) {
    return box.values
        .where((channels) => channels.isMatchingFilter(request.call()))
        .toList();
  }
}
