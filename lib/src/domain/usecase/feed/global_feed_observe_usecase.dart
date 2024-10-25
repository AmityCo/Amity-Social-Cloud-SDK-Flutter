import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

class GlobalFeedObserveUseCase
    extends ObserverUseCase<List<AmityPost>, GetGlobalFeedRequest> {
  final GlobalFeedRepo globalFeedRepo;
  final PostRepo postRepo;
  final PagingIdRepo pagingIdRepo;
  final PostComposerUsecase postComposerUsecase;

  final nonce = AmityNonce.GLOBAL_FEED.value;

  GlobalFeedObserveUseCase({
    required this.globalFeedRepo,
    required this.postRepo,
    required this.postComposerUsecase,
    required this.pagingIdRepo,
  });

  @override
  StreamController<List<AmityPost>> listen(
      RequestBuilder<GetGlobalFeedRequest> request) {
    final hash = request().getHashCode();
    final streamController = StreamController<List<AmityPost>>();
    _onChanges(streamController, request);
    globalFeedRepo.listenPostsChanges(request).listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetGlobalFeedRequest> request,
  ) {
    final hash = request().getHashCode();
    if (streamController.isClosed) {
      return;
    }
    final entities = globalFeedRepo.getFeedPostEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (entities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityPost>[]);
    } else {
      final ids = pagingIds.map((e) => e.id).toList();
      final posts = entities
          .where((entity) => ids.contains(entity.postId))
          .map((e) => e.convertToAmityPost())
          .toList()
        ..sort((a, b) {
          var positionA =
              pagingIds.firstWhere((p) => p.id == a.postId).position ?? 0;
          var positionB =
              pagingIds.firstWhere((p) => p.id == b.postId).position ?? 0;
          return positionA.compareTo(positionB);
        });

      Stream.fromIterable(posts)
          .asyncMap((element) =>
            postComposerUsecase.get(element)
          )
          .toList()
          .then((list) {
            if (!streamController.isClosed) {
              streamController.add(list);
            }
          });
    }
  }
}