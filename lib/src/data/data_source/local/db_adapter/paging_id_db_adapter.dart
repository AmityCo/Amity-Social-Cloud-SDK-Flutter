import 'package:amity_sdk/src/data/data_source/local/hive_entity/paging_id_hive_entity_29.dart';

abstract class PagingIdDbAdapter {
  
  Future savePagingIdEntity(PagingIdHiveEntity data);

  List<PagingIdHiveEntity> getPagingIdEntities(int nonce, int hash);

  Stream<List<PagingIdHiveEntity>> listenPagingIdEntities(int nonce, int hash);

  Future deletePagingIdByHash(int nonce, int hash);

}