import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/converter/pin_hive_entity_extension_converter.dart';
import 'package:amity_sdk/src/data/converter/pinned_post_query_response_extension_converter.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/remote/api_interface/pin_api_interface.dart';
import 'package:amity_sdk/src/domain/model/amity_pinned_post.dart';
import 'package:amity_sdk/src/domain/repo/pin_repo.dart';
import 'package:collection/collection.dart';

class PinRepoImpl extends PinRepo {
  final PinApiInterface pinApiInterface;
  final DbAdapterRepo dbAdapterRepo;

  PinRepoImpl({
    required this.pinApiInterface,
    required this.dbAdapterRepo,
  });

  @override
  Future queryPinnedPost(QueryPinnedPostRequest request) async {
    final data = (request.placement == null)
        ? await pinApiInterface.queryPinnedPost(request.targetId)
        : await pinApiInterface.queryPinnedPostWithPlacement(request);
    await data.saveToDb(dbAdapterRepo);
    final hash = request.getHashCode();
    final nonce = AmityNonce.PINNED_POST_LIST;
    int nextIndex = 0;
    final pagingIdDbAdapter = dbAdapterRepo.pagingIdDbAdapter;
    await pagingIdDbAdapter.deletePagingIdByHash(nonce.value, hash);
    final target = data.getTartget();
    if (target != null) {
      data.pins.forEachIndexed((index, element) async {
        final pagingId = PagingIdHiveEntity(
          id: element.getId(target),
          hash: hash,
          nonce: nonce.value,
          position: nextIndex + index,
        );
        await pagingIdDbAdapter.savePagingIdEntity(pagingId);
      });
    }
  }

  @override
  Stream<List<AmityPinnedPost>> listenPinnedPosts(
      RequestBuilder<QueryPinnedPostRequest> request) {
    final pinnedPosts = dbAdapterRepo.pinDbAdapter.listenPinnedPostEntities(request);
    return pinnedPosts.map((event) => event.map((e) => e.convertToAmityPinnedPost()).toList());
  }

  @override
  List<PinHiveEntity> getPinnedPostEntities(
      RequestBuilder<QueryPinnedPostRequest> request) {
    return  dbAdapterRepo.pinDbAdapter.getPinnedPostEntities(request);
  }
}
