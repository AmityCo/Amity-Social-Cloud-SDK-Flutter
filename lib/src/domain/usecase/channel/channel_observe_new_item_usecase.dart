import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';
import 'package:collection/collection.dart';

class ChannelObserveNewItemUseCase
    extends ObserverUseCase<PagingIdHiveEntity, GetChannelRequest> {
  /// Channel Repo
  final ChannelRepo channelRepo;
  final PagingIdRepo pagingIdRepo;
  HashMap<String, bool> channelIdMap = HashMap();

  ChannelObserveNewItemUseCase(
      {required this.channelRepo, required this.pagingIdRepo});

  @override
  StreamController<PagingIdHiveEntity> listen(RequestBuilder<GetChannelRequest> params) {
    final streamController = StreamController<PagingIdHiveEntity>();
    if (params.call().sortBy == "lastActivity") {
      channelRepo.listenChannels(params).listen((event) async {
        _onChanges(streamController, params);
      });
    }
    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<GetChannelRequest> request,
  ) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    var firstPosition = 0;
    if (streamController.isClosed) {
      return;
    }
    final channelEntities = channelRepo.getChannelEntities(request);
    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    if (pagingIds.isNotEmpty){
      firstPosition = pagingIds.map( 
        (e) => e.position ?? 0
      ).reduce(min);
    }
    if (channelEntities.isNotEmpty && pagingIds.isNotEmpty) {
      final channelIds = pagingIds.map((e) => e.id).toList();
      channelEntities.sort((a, b) => (a.lastActivity ?? DateTime.now()).compareTo((b.lastActivity ?? DateTime.now())));
      final channelId = channelEntities
          .where((channel) => !channelIds.contains(channel.channelId))
          .firstOrNull
          ?.channelId;
      if (channelId != null && channelIdMap[channelId] != true) {
        final pagingId = PagingIdHiveEntity(
          id: channelId,
          hash: hash,
          nonce: nonce,
          position: firstPosition - 1,
        );
        if (!streamController.isClosed) {
          channelIdMap[channelId] = true;
          streamController.add(pagingId);
        }
      }
    }
  }
}
