import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/pin_hive_entity_36.dart';

abstract class PinDbAdapter {
  Future savePinEntity(PinHiveEntity data);
  Stream<List<PinHiveEntity>> listenPinnedPostEntities(RequestBuilder<QueryPinnedPostRequest> request);
  List<PinHiveEntity> getPinnedPostEntities(RequestBuilder<QueryPinnedPostRequest> request);
}
