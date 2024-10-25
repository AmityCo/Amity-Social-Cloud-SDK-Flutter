import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/query_pinned_post_request.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/converter/pin_hive_entity_extension_converter.dart';
import 'package:amity_sdk/src/domain/composer_usecase/pinned_post_composer_usecase.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:amity_sdk/src/domain/repo/pin_repo.dart';

class PinnedPostObserveQueryUseCase
    extends ObserverUseCase<List<AmityPinnedPost>, QueryPinnedPostRequest> {
  final PinRepo pinRepo;
  final PostRepo postRepo;
  final PagingIdRepo pagingIdRepo;
  final PinnedPostComposerUsecase pinnedPostComposerUsecase;
  final nonce = AmityNonce.PINNED_POST_LIST.value;

  PinnedPostObserveQueryUseCase(
      {required this.pinRepo,
      required this.postRepo,
      required this.pagingIdRepo,
      required this.pinnedPostComposerUsecase,
    });

  @override
  StreamController<List<AmityPinnedPost>> listen(
      RequestBuilder<QueryPinnedPostRequest> request) {
    final hash = request().getHashCode();
    final streamController = StreamController<List<AmityPinnedPost>>();
      _onChanges(streamController, request);
    pinRepo.listenPinnedPosts(request).listen((event) async {
      _onChanges(streamController, request);
    });
    postRepo.listenAllPostEntities().listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<QueryPinnedPostRequest> request,
  ) {
    final hash = request().getHashCode();
    if (streamController.isClosed) {
      return;
    }
    final pinnedPostEntities = pinRepo.getPinnedPostEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (pinnedPostEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityPinnedPost>[]);
    } else {
      final pinIds = pagingIds.map((e) => e.id).toList();
      final pinnedPosts = pinnedPostEntities
        .where((pinnedPost) => pinIds.contains(pinnedPost.pinId))
        .map((e) => e.convertToAmityPinnedPost())
        .toList()
        ..sort((a, b) {
          var positionA = pagingIds.firstWhere((p) => p.id == a.pinId).position ?? 0;
          var positionB = pagingIds.firstWhere((p) => p.id == b.pinId).position ?? 0;
          return positionA.compareTo(positionB);
        });

      Stream.fromIterable(pinnedPosts).asyncMap((element) =>
        pinnedPostComposerUsecase.get(element)
      ).toList().then((value) {
        final excludeDeletedPosts = value.where((element) => element.post?.isDeleted == false).toList();
        if (!streamController.isClosed) {
          streamController.add(excludeDeletedPosts);
        }
      });
    }
  }
}
