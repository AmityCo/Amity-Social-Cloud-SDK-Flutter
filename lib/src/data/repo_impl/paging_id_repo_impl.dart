// ignore_for_file: unused_local_variable

import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/paging_id_hive_entity_29.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

/// [PagingIdRepoImpl]
class PagingIdRepoImpl extends PagingIdRepo {

  ///Db Adapter
  final DbAdapterRepo commonDbAdapter;

  /// init [PagingIdRepoImpl]
  PagingIdRepoImpl({
    required this.commonDbAdapter,
  });

  @override
  Future savePagingId(PagingIdHiveEntity data) async {
    await commonDbAdapter.pagingIdDbAdapter.savePagingIdEntity(data);
  }

  @override
  List<PagingIdHiveEntity> getPagingIdEntities(int nonce, int hash) {
    return commonDbAdapter.pagingIdDbAdapter.getPagingIdEntities(nonce, hash);
  }

  @override
  Stream<List<PagingIdHiveEntity>> listenPagingIdEntities(int nonce, int hash) {
    return commonDbAdapter.pagingIdDbAdapter.listenPagingIdEntities(nonce, hash);
  }

  @override
  Future deletePagingIdByHash(int nonce, int hash) {
    return commonDbAdapter.pagingIdDbAdapter.deletePagingIdByHash(nonce, hash);
  }
}
