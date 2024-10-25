import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_feed_request.dart';
import 'package:amity_sdk/src/core/utils/page_list_data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/post_hive_entity_5.dart';

abstract class GlobalFeedRepo {
  Future<PageListData<List<AmityPost>, String>> getGlobalFeed(
      GetGlobalFeedRequest request);
  Stream<PageListData<List<AmityPost>, String>> getGlobalFeedStream(
      GetGlobalFeedRequest request);
  Future<PageListData<List<AmityPost>, String>> getCustomPostRanking(
      GetGlobalFeedRequest request);
  Stream<List<AmityPost>> listenPostsChanges(
      RequestBuilder<GetGlobalFeedRequest> request);
  List<PostHiveEntity> getFeedPostEntities(
      RequestBuilder<GetGlobalFeedRequest> request);
  Future<PageListData<List<AmityPost>, String>> queryGlobalFeed(
    GetGlobalFeedRequest request,
    bool isCustomRanking,
  );
}
