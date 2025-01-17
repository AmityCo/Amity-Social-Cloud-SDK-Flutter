import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/utils/amity_nonce.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/paging_id_repo.dart';

class MessageObserveListUseCase
    extends ObserverUseCase<List<AmityMessage>, MessageQueryRequest> {
  final MessageRepo messageRepo;
  final PagingIdRepo pagingIdRepo;
  final MessageComposerUsecase messageComposerUsecase;

  MessageObserveListUseCase(
      {required this.messageRepo,
      required this.pagingIdRepo,
      required this.messageComposerUsecase});

  @override
  StreamController<List<AmityMessage>> listen(
      RequestBuilder<MessageQueryRequest> request) {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    final streamController = StreamController<List<AmityMessage>>();
    messageRepo.listenMessages(request).listen((event) async {
      _onChanges(streamController, request);
    });
    pagingIdRepo.listenPagingIdEntities(nonce, hash).listen((event) async {
      _onChanges(streamController, request);
    });

    return streamController;
  }

  void _onChanges(
    StreamController streamController,
    RequestBuilder<MessageQueryRequest> request,
  ) async {
    final hash = request().getHashCode();
    final nonce = request().getNonce().value;
    if (streamController.isClosed) {
      return;
    }
    final messageEntities = messageRepo.getMessageEntities(request);

    final pagingIds = pagingIdRepo.getPagingIdEntities(nonce, hash);
    pagingIds.sort((a, b) => (a.position ?? 0).compareTo(b.position ?? 0));
    if (messageEntities.isEmpty || pagingIds.isEmpty) {
      streamController.add(<AmityMessage>[]);
    } else {
      final uniqueIds = pagingIds.map((e) => e.id).toList();
      final messages = messageEntities
        .where((message) => uniqueIds.contains(message.uniqueId))
        .map((e) => e.convertToAmityMessage())
        .toList()
        ..sort((a, b) => 
          (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now())
        );
      await Stream.fromIterable(messages).forEach((element) async {
        element = await messageComposerUsecase.get(element);
      });
      if (!streamController.isClosed) {
        streamController.add(messages);
      }
    }
  }
}
