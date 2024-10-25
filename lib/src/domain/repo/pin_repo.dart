import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/pin_hive_entity_35.dart';
import 'package:amity_sdk/src/domain/model/amity_pinned_post.dart';

abstract class PinRepo {
  Future queryPinnedPost(
      QueryPinnedPostRequest request);

  Stream<List<AmityPinnedPost>> listenPinnedPosts(
    RequestBuilder<QueryPinnedPostRequest> request);
  
  List<PinHiveEntity> getPinnedPostEntities(
    RequestBuilder<QueryPinnedPostRequest> request);
}