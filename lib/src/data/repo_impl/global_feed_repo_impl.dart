import 'dart:async';
import 'dart:math';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/model/api_request/get_custom_rank_feed_request.dart';
import 'package:amity_sdk/src/core/model/api_request/get_global_feed_request.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/core/utils/page_list_data.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/repo/global_feed_repo.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

/// Global Feed Repo Impl
class GlobalFeedRepoImpl extends GlobalFeedRepo {
  /// Global Feed Repo Interface
  final GlobalFeedApiInterface feedApiInterface;

  /// Common Db Adapter
  final DbAdapterRepo dbAdapterRepo;

  final PagingIdRepo pagingIdRepo;

  /// Init Global Feed Repo Impl
  GlobalFeedRepoImpl({
    required this.feedApiInterface,
    required this.dbAdapterRepo,
    required this.pagingIdRepo,
  });

  @override
  Future<PageListData<List<AmityPost>, String>> getGlobalFeed(
      GetGlobalFeedRequest request) async {
    final data = await feedApiInterface.getGlobalFeed(request);

    //Save the feed sequence in to feed db
    await dbAdapterRepo.feedDbAdapter
        .updateFeedCollection(data.convertToFeedHiveEntity());

    // final amitPosts = await dbAdapterRepo.saveDataToDb(data);
    final amitPosts = await data.saveToDb<AmityPost>(dbAdapterRepo);

    return PageListData(amitPosts, data.paging!.next ?? '');
  }

  @override
  Stream<PageListData<List<AmityPost>, String>> getGlobalFeedStream(
      GetGlobalFeedRequest request) {
    StreamController<PageListData<List<AmityPost>, String>> controller =
        StreamController<PageListData<List<AmityPost>, String>>();

    ///1. Get Feed Collection from the DB
    _getGlobalFeedCollectionFromDb('${request.hashCode}').then((value) {
      if (value != null) {
        controller.add(value);
      }
    }).onError((error, stackTrace) {});

    /// 2. Make the API request and send the updated data back
    getGlobalFeed(request).then((value) {
      controller.add(value);
    });

    ///3. Listen any chagnes in the Amity Post Db and send the update back
    dbAdapterRepo.feedDbAdapter
        .listenFeedEntity('${request.hashCode}')
        .listen((event) {
      //there is a change in collection, get the collection from the db and add it to stream
      _getGlobalFeedCollectionFromDb('${request.hashCode}').then((value) {
        if (value != null) {
          controller.add(value);
        }
      });
    });

    return controller.stream;
  }

  Future<PageListData<List<AmityPost>, String>?> _getGlobalFeedCollectionFromDb(
      String collectionId) async {
    //Get feed collection from the db
    final data = dbAdapterRepo.feedDbAdapter.getFeedEntity(collectionId);

    if (data != null) {
      //Get all the post in feed collection from post db
      final amitPosts = await Stream.fromIterable(data.postIds!)
          .asyncMap((element) async => dbAdapterRepo.postDbAdapter
              .getPostEntity(element)!
              .convertToAmityPost())
          .toList();

      //return tuple for token and amitypost list
      return PageListData(amitPosts, data.nextToken!);
    }

    return Future.value();
  }

  @override
  Future<PageListData<List<AmityPost>, String>> getCustomPostRanking(
      GetCustomRankFeedRequest request) async {
    final data = await feedApiInterface.getCustomPostRanking(request);

    //Save the feed sequence in to feed db
    await dbAdapterRepo.feedDbAdapter
        .updateFeedCollection(data.convertToFeedHiveEntity());

    // final amitPosts = await dbAdapterRepo.saveDataToDb(data);
    final amitPosts = await data.saveToDb<AmityPost>(dbAdapterRepo);

    return PageListData(amitPosts, data.paging!.next ?? '');
  }

  @override
  Stream<List<AmityPost>> listenPostsChanges(
      RequestBuilder<GetGlobalFeedRequest> request) {
    final entities = dbAdapterRepo.postDbAdapter.listenAllPostEntities();

    // For notify changes from post db only
    return entities.map((event) => []);
  }

  @override
  List<PostHiveEntity> getFeedPostEntities(
      RequestBuilder<GetGlobalFeedRequest> request) {
    return dbAdapterRepo.postDbAdapter.getAllPostEntities();
  }

  @override
  Future<PageListData<List<AmityPost>, String>> queryGlobalFeed(
    GetGlobalFeedRequest request  ) async {
    final nonce = request.getNonce();
    final hash = request.getHashCode();
    final pagingIdDbAdapter = dbAdapterRepo.pagingIdDbAdapter;
    int nextIndex = 0;
    final isFirstPage = request.token == null && (request.limit ?? 0) > 0;
    //TODO: request.options.token is gone after call data.saveToDb, might cause further issue in the future
    final data = await feedApiInterface.getGlobalFeed(request);
    await data.saveToDb(dbAdapterRepo);
    if (isFirstPage) {
      await pagingIdDbAdapter.deletePagingIdByHash(nonce.value, hash);
    } else {
      nextIndex = (pagingIdRepo
              .getPagingIdEntities(nonce.value, hash)
              .map((e) => (e.position ?? 0))
              .toList()
              .reduce(max)) +
          1;
    }
    data.posts.forEachIndexed((index, element) async {
      final pagingId = PagingIdHiveEntity(
        id: element.postId,
        hash: hash,
        nonce: nonce.value,
        position: nextIndex + index,
      );
      await pagingIdDbAdapter.savePagingIdEntity(pagingId);
    });

    // Return token for the next page only
    // the live collection will get the result through the observe usecase
    return PageListData([], data.paging?.next ?? '');
  }

  @override
  List<PostHiveEntity> getCustomRankFeedPostEntities(
      RequestBuilder<GetCustomRankFeedRequest> request) {
    return dbAdapterRepo.postDbAdapter.getAllPostEntities();
  }

  @override
  Stream<List<AmityPost>> listenCustomRankPostsChanges(
      RequestBuilder<GetCustomRankFeedRequest> request) {
    final entities = dbAdapterRepo.postDbAdapter.listenAllPostEntities();

    // For notify changes from post db only
    return entities.map((event) => []);
  }

  @override
  Future<PageListData<List<AmityPost>, String>> queryCustomRankFeed(
      GetCustomRankFeedRequest request) async {
        final nonce =request.getNonce();
    final hash = request.getHashCode();
    final pagingIdDbAdapter = dbAdapterRepo.pagingIdDbAdapter;
    int nextIndex = 0;
    final isFirstPage = request.token == null && (request.limit ?? 0) > 0;
    //TODO: request.options.token is gone after call data.saveToDb, might cause further issue in the future
    final data = await feedApiInterface.getCustomPostRanking(request);
    await data.saveToDb(dbAdapterRepo);
    if (isFirstPage) {
      await pagingIdDbAdapter.deletePagingIdByHash(nonce.value, hash);
    } else {
      nextIndex = (pagingIdRepo
              .getPagingIdEntities(nonce.value, hash)
              .map((e) => (e.position ?? 0))
              .toList()
              .reduce(max)) +
          1;
    }
    data.posts.forEachIndexed((index, element) async {
      final pagingId = PagingIdHiveEntity(
        id: element.postId,
        hash: hash,
        nonce: nonce.value,
        position: nextIndex + index,
      );
      await pagingIdDbAdapter.savePagingIdEntity(pagingId);
    });

    // Return token for the next page only
    // the live collection will get the result through the observe usecase
    return PageListData([], data.paging?.next ?? '');
  }
}
