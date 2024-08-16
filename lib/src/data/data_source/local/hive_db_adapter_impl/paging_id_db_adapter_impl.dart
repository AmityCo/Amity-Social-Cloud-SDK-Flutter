import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/paging_id_hive_entity_29.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class PagingIdDbAdapterImpl extends PagingIdDbAdapter {
  
  PagingIdDbAdapterImpl({required this.dbClient});
  final DBClient dbClient;
  late Box<PagingIdHiveEntity> box;
  Future<PagingIdDbAdapter> init() async {
    Hive.registerAdapter(PagingIdHiveEntityAdapter(), override: true);
    box = await Hive.openBox<PagingIdHiveEntity>('paging_id_db');
    return this;
  }
  
  @override
  Future savePagingIdEntity(PagingIdHiveEntity data) async {
    await box.put(data.id, data);
  }
  
  @override
  List<PagingIdHiveEntity> getPagingIdEntities(int nonce, int hash) {
    return box.values
        .where((pagingId) => pagingId.hash == hash && pagingId.nonce == nonce)
        .sorted((a, b) => (a.position ?? 0).compareTo(a.position ?? 0))
        .toList();
  }

  @override
  Stream<List<PagingIdHiveEntity>> listenPagingIdEntities(int nonce, int hash) {
    return box.watch().map((event) => box.values
        .where((pagingId) => pagingId.hash == hash && pagingId.nonce == nonce)
        .sorted((a, b) => (a.position ?? 0).compareTo(a.position ?? 0))
        .toList());
  }

  @override
  Future deletePagingIdByHash(int nonce, int hash) async {
    return box.values
      .where((pagingId) => pagingId.hash == hash && pagingId.nonce == nonce)
      .forEach((pagingId) async { 
        await box.delete(pagingId.id);
      });
  }
}
