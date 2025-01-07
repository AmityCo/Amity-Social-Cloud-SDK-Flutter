import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

class UserObserveListUseCase
    extends ObserverUseCase<List<AmityUser>, UsersRequest> {
  final UserRepo userRepo;
  final PagingIdRepo pagingIdRepo;
  final UserComposerUsecase userComposerUsecase;
  final nonce = AmityNonce.USER_LIST.value;

  UserObserveListUseCase(
      {required this.userRepo,
      required this.pagingIdRepo,
      required this.userComposerUsecase});

  @override
  StreamController<List<AmityUser>> listen(
      RequestBuilder<UsersRequest> request) {
    final hash = request().getHashCode();
    final streamController = StreamController<List<AmityUser>>();
    userRepo.listenUserChanges(request).distinct().listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<UsersRequest> request,
  ) {
    final hash = request().getHashCode();
    if (streamController.isClosed) {
      return;
    }
    final userEntities = userRepo.getUserEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    pagingIds.sort((a, b) => (a.position ?? 0).compareTo(b.position ?? 0));
    if (userEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityUser>[]);
    } else {
      var userEntitiesSorted = <UserHiveEntity>[];
      final userIds = pagingIds.map((e) => e.id).toList();
      // Sort user entities by position from pagingIds
      for (var userId in userIds) {
        final UserHiveEntity? user =
            userEntities.where((user) => user.userId == userId).firstOrNull;
        if (user != null) {
          userEntitiesSorted.add(user);
        }
      }
      final users = userEntitiesSorted.map((e) => e.convertToAmityUser()).toList();
      Stream.fromIterable(users).forEach((element) async {
        element = await userComposerUsecase.get(element);
      });
      
      if (!streamController.isClosed) {
        streamController.add(users);
      }
    }
  }
}
