import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

class CommunityObserveListUseCase
    extends ObserverUseCase<List<AmityCommunity>, GetCommunityRequest> {
  final CommunityRepo communityRepo;
  final PagingIdRepo pagingIdRepo;
  final CommunityComposerUsecase communityComposerUsecase;

  CommunityObserveListUseCase(
      {required this.communityRepo,
      required this.pagingIdRepo,
      required this.communityComposerUsecase});

  @override
  StreamController<List<AmityCommunity>> listen(
      RequestBuilder<GetCommunityRequest> request) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    final streamController = StreamController<List<AmityCommunity>>();

    _onChanges(streamController, request);

    communityRepo.listenCommunities(request).listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetCommunityRequest> request,
  ) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    if (streamController.isClosed) {
      return;
    }
    final communityEntities = communityRepo.getCommunityEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (communityEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityCommunity>[]);
    } else {
      final communityIds = pagingIds.map((e) => e.id).toList();
      final communities = communityEntities
          .where((community) => communityIds.contains(community.communityId))
          .map((e) => e.convertToAmityCommunity())
          .toList()
        ..sort((a, b) {
          var positionA =
              pagingIds.firstWhere((p) => p.id == a.communityId).position ?? 0;
          var positionB =
              pagingIds.firstWhere((p) => p.id == b.communityId).position ?? 0;
          return positionA.compareTo(positionB);
        });

      Stream.fromIterable(communities).forEach((element) async {
        element = await communityComposerUsecase.get(element);
      });
      if (!streamController.isClosed) {
        streamController.add(communities);
      }
    }
  }
}
