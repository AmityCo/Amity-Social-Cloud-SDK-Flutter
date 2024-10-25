import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/db_adapter/pin_db_adapter.dart';
import 'package:hive/hive.dart';

class PinDbAdapterImpl extends PinDbAdapter {
  PinDbAdapterImpl({required this.dbClient});
  final DBClient dbClient;
  late Box<PinHiveEntity> box;
  Future<PinDbAdapter> init() async {
    Hive.registerAdapter(PinHiveEntityAdapter(), override: true);
    box = await Hive.openBox<PinHiveEntity>('pin_db');
    return this;
  }

  @override
  Future savePinEntity(PinHiveEntity data) async {
    await box.put(data.pinId, data);
  }

  @override
  Stream<List<PinHiveEntity>> listenPinnedPostEntities(
      RequestBuilder<QueryPinnedPostRequest> request) {
    return box.watch().map((event) => box.values
        .where((community) => community.isMatchingFilter(request.call()))
        .toList());
  }

  @override
  List<PinHiveEntity> getPinnedPostEntities(
      RequestBuilder<QueryPinnedPostRequest> request) {
    return box.values
        .where((pin) => pin.isMatchingFilter(request.call()))
        .toList();
  }
}
