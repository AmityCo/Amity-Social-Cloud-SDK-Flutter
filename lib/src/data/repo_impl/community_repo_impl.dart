// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:math';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/mapper/community_model_mapper.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/paging_id_hive_entity_29.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

class CommunityRepoImpl extends CommunityRepo {
  final CommunityApiInterface communityApiInterface;

  //Db Adapter
  final CommunityDbAdapter communityDbAdapter;
  final CommentDbAdapter commentDbAdapter;
  final UserDbAdapter userDbAdapter;
  final FileDbAdapter fileDbAdapter;
  final CommunityCategoryDbAdapter communityCategoryDbAdapter;
  final CommunityFeedDbAdapter communityFeedDbAdapter;
  final CommunityMemberDbAdapter communityMemberDbAdapter;

  // Paging Id Repository
  final PagingIdRepo pagingIdRepo;

  CommunityRepoImpl({
    required this.communityApiInterface,
    required this.communityDbAdapter,
    required this.commentDbAdapter,
    required this.userDbAdapter,
    required this.fileDbAdapter,
    required this.communityCategoryDbAdapter,
    required this.communityFeedDbAdapter,
    required this.communityMemberDbAdapter,
    required this.pagingIdRepo,
  });

  @override
  Future<AmityCommunity> createCommunity(CreateCommunityRequest request) async {
    final data = await communityApiInterface.createCommunity(request);
    return (await saveCommunity(data)).first;
  }

  @override
  Future<AmityCommunity?> getCommunityById(String communityId) async {
    return communityDbAdapter
        .getCommunityEntity(communityId)
        ?.convertToAmityCommunity();
  }

  @override
  Future deleteCommunity(String communityId) async {
    final data = await communityApiInterface.deleteCommunity(communityId);

    ///Get the post from DB and update the delete flag to true
    final amityCommunityDb = communityDbAdapter.getCommunityEntity(communityId);
    if (amityCommunityDb != null) {
      amityCommunityDb
        ..isDeleted = true
        ..save();
    }

    return data;
  }

  @override
  Future<AmityCommunity> getCommunity(String communityId) async {
    final data = await communityApiInterface.getCommunity(communityId);
    final amityCommunity = await saveCommunity(data);
    return amityCommunity.first;
  }

  @override
  Future<AmityCommunity> updateCommunity(CreateCommunityRequest request) async {
    final data = await communityApiInterface.updateCommunity(request);
    final amityCommunity = await saveCommunity(data);
    return amityCommunity.first;
  }

  Future saveCommunities(CreateCommunityResponse data) async {
    //Convert to File Hive Entity
    //we have save the file first, since every object depends on file
    List<FileHiveEntity> fileHiveEntities =
        data.files.map((e) => e.convertToFileHiveEntity()).toList();

    //Convert to User Hive Entity
    List<UserHiveEntity> userHiveEntities =
        data.users.map((e) => e.convertToUserHiveEntity()).toList();

    //Conver to category hive entity
    List<CommunityCategoryHiveEntity> communityCategoryHiveEnties = data
        .categories
        .map((e) => e.convertToCommunityCategoryHiveEntity())
        .toList();

    //Conver to Feed hive entity
    List<CommunityFeedHiveEntity> communityFeedHiveEnties =
        data.feeds.map((e) => e.convertToCommunityFeedHiveEntity()).toList();

    //Conver to Feed hive entity
    List<CommunityHiveEntity> communityHiveEnties =
        data.communities.map((e) => e.convertToCommunityHiveEntity()).toList();

    //Convert to Community Member Hive Entity
    List<CommunityMemberHiveEntity> communityMemberHiveEntities = data
        .communityUsers
        .map((e) => e.convertToCommnityMemberHiveEntity())
        .toList();

    //Save the File Entity
    for (var e in fileHiveEntities) {
      await fileDbAdapter.saveFileEntity(e);
    }

    //Save the User Entity
    for (var e in userHiveEntities) {
      await userDbAdapter.saveUserEntity(e);
    }

    //Save the Community Category Entity
    for (var e in communityCategoryHiveEnties) {
      await communityCategoryDbAdapter.saveCommunityCategoryEntity(e);
    }

    //Save the Community Feed Entity
    for (var e in communityFeedHiveEnties) {
      await communityFeedDbAdapter.saveCommunityFeedEntity(e);
    }

    //Save the Community  Entity
    await communityDbAdapter.saveCommunityEntities(communityHiveEnties);

    //Save the Community Member Entity
    for (var e in communityMemberHiveEntities) {
      final UserHiveEntity? user = userHiveEntities
          .firstWhereOrNull((element) => element.userId == e.userId);
      await communityMemberDbAdapter.saveCommunityMemberEntity(e, user);
    }

    return communityHiveEnties.map((e) => e.convertToAmityCommunity()).toList();
  }

  Future<List<AmityCommunity>> saveCommunity(CreateCommunityResponse data,
      {bool isQuery = false}) async {
    //Convert to File Hive Entity
    //we have save the file first, since every object depends on file
    List<FileHiveEntity> fileHiveEntities =
        data.files.map((e) => e.convertToFileHiveEntity()).toList();

    //Convert to User Hive Entity
    List<UserHiveEntity> userHiveEntities =
        data.users.map((e) => e.convertToUserHiveEntity()).toList();

    //Conver to category hive entity
    List<CommunityCategoryHiveEntity> communityCategoryHiveEnties = data
        .categories
        .map((e) => e.convertToCommunityCategoryHiveEntity())
        .toList();

    //Conver to Feed hive entity
    List<CommunityFeedHiveEntity> communityFeedHiveEnties =
        data.feeds.map((e) => e.convertToCommunityFeedHiveEntity()).toList();

    //Conver to Feed hive entity
    List<CommunityHiveEntity> communityHiveEnties =
        data.communities.map((e) => e.convertToCommunityHiveEntity()).toList();

    //Convert to Community Member Hive Entity
    List<CommunityMemberHiveEntity> communityMemberHiveEntities = data
        .communityUsers
        .map((e) => e.convertToCommnityMemberHiveEntity())
        .toList();

    //Save the File Entity
    for (var e in fileHiveEntities) {
      await fileDbAdapter.saveFileEntity(e);
    }

    //Save the User Entity
    for (var e in userHiveEntities) {
      await userDbAdapter.saveUserEntity(e);
    }

    //Save the Community Category Entity
    for (var e in communityCategoryHiveEnties) {
      await communityCategoryDbAdapter.saveCommunityCategoryEntity(e);
    }

    //Save the Community Feed Entity
    for (var e in communityFeedHiveEnties) {
      await communityFeedDbAdapter.saveCommunityFeedEntity(e);
    }

    //Save the Community  Entity
    for (var e in communityHiveEnties) {
      if (isQuery) {
        e.queryTimestamp = DateTime.now();
      }
      await communityDbAdapter.saveCommunityEntity(e);
    }

    //Save the Community Member Entity
    for (var e in communityMemberHiveEntities) {
      final UserHiveEntity? user = userHiveEntities
          .firstWhereOrNull((element) => element.userId == e.userId);
      await communityMemberDbAdapter.saveCommunityMemberEntity(e, user);
    }

    return communityHiveEnties.map((e) => e.convertToAmityCommunity()).toList();
  }

  @override
  Future<AmityCommunityCategory?> getCommunityCategoryById(
      String categoryId) async {
    return communityCategoryDbAdapter
        .getCommunityCategoryEntity(categoryId)
        ?.convertToAmityCommunityCategory();
  }

  @override
  Future<PageListData<List<AmityCommunity>, String>> getCommunityQuery(
      GetCommunityRequest request) async {
    if (request.options?.token == null) {
      await communityDbAdapter.deleteCommunityEntities();
    }
    final data = await communityApiInterface.getCommunityQuery(request);
    final amityCommunity = await saveCommunity(data, isQuery: true);
    return PageListData(amityCommunity, data.paging?.next ?? '');
  }

  @override
  Future<PageListData<List<AmityCommunity>, String>> queryCommunities(
      GetCommunityRequest request) async {
    final hash = request.getHashCode();
    final nonce = request.getNonce();
    int nextIndex = 0;
    final isFirstPage = request.options?.token == null && (request.options?.limit ?? 0) > 0;
    final data = await communityApiInterface.getCommunityQuery(request);
    final paging = data.paging;
    await saveCommunities(data);
    if (request.options?.token == null) {
      await pagingIdRepo.deletePagingIdByHash(nonce.value, hash);
    } else {
      nextIndex = (pagingIdRepo
              .getPagingIdEntities(nonce.value, hash)
              .map((e) => (e.position ?? 0))
              .toList()
              .reduce(max)) +
          1;
    }
    data.communities.forEachIndexed((index, element) async {
      final pagingId = PagingIdHiveEntity(
        id: element.communityId,
        hash: hash,
        nonce: nonce.value,
        position: nextIndex + index,
      );
      await pagingIdRepo.savePagingId(pagingId);
    });
    return PageListData([], data.paging?.next ?? '');
  }

  @override
  Future<List<AmityCommunity>> getRecommendedCommunity(
      OptionsRequest request) async {
    final data = await communityApiInterface.getRecommendedCommunity(request);
    final amityCommunity = await saveCommunity(data);
    return amityCommunity;
  }

  @override
  Future<List<AmityCommunity>> getTopTrendingCommunity(
      OptionsRequest request) async {
    final data = await communityApiInterface.getTopTredningCommunity(request);
    final amityCommunity = await saveCommunity(data);
    return amityCommunity;
  }

  @override
  bool hasLocalCommunity(String communityId) {
    return communityDbAdapter.getCommunityEntity(communityId) != null;
  }

  @override
  List<CommunityHiveEntity> getCommunityEntities(
      RequestBuilder<GetCommunityRequest> request) {
    return communityDbAdapter.getCommunityEntities(request);
  }

  @override
  Future saveCommunityEntity(CommunityHiveEntity entity) {
    return communityDbAdapter.saveCommunityEntity(entity);
  }

  @override
  Stream<List<AmityCommunity>> listenCommunity(
      RequestBuilder<GetCommunityRequest> request) {
    return communityDbAdapter.listenCommunityEntities(request).map((event) {
      final req = request.call();
      final List<AmityCommunity> list = [];

      if (req.sortBy == AmityCommunitySortOption.LAST_CREATED.apiKey) {
        event.sort((a, b) => a.createdAt!.compareTo(b.createdAt!) * -1);
      } else if (req.sortBy == AmityCommunitySortOption.FIRST_CREATED.apiKey) {
        event.sort((a, b) => a.createdAt!.compareTo(b.createdAt!) * 1);
      } else {
        // For displayName sorting we need to let the order be same with BE
        event.sort((a, b) {
          if (a.queryTimestamp != null && b.queryTimestamp != null) {
            return a.queryTimestamp!.compareTo(b.queryTimestamp!);
          }

          return 0;
        });
      }

      for (var element in event) {
        list.add(element.convertToAmityCommunity());
      }

      return list;
    });
  }

  @override
  Future<AmityCommunity?> fetchAndSave(String objectId) async {
    var community = await getCommunity(objectId);
    if (community != null) {
      return community;
    } else {
      await deleteCommunity(objectId);
      return Future.value(null);
    }
  }

  @override
  ModelMapper<CommunityHiveEntity, AmityCommunity> mapper() {
    return CommunityModelMapper();
  }

  @override
  StreamController<CommunityHiveEntity> observeFromCache(String objectId) {
    final streamController = StreamController<CommunityHiveEntity>();
    communityDbAdapter.listenCommunityEntity(objectId).listen((event) {
      streamController.add(event);
    });
    return streamController;
  }

  @override
  Future<CommunityHiveEntity?> queryFromCache(String objectId) async {
    return communityDbAdapter.getCommunityEntity(objectId);
  }

  @override
  int getPostCount(String targetId, String feedType) {
    try {
      var feed =  communityFeedDbAdapter.getCommunityFeedByFeedType(targetId, feedType);
      return feed.postCount ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Stream<List<AmityCommunity>> listenCommunities(
      RequestBuilder<GetCommunityRequest> request) {
    final communities = communityDbAdapter.listenCommunityEntities(request);
    return communities.map((event) => event.map((e) => e.convertToAmityCommunity()).toList());
  }
}
