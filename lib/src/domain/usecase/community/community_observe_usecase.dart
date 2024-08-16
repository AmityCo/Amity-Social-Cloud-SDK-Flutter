import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class CommunityObserveUseCase
    extends UseCase<List<AmityCommunity>, GetCommunityRequest> {
  final CommunityRepo communityRepo;
  final CommunityComposerUsecase communityComposerUsecase;

  CommunityObserveUseCase(
      {required this.communityRepo, required this.communityComposerUsecase});

  @override
  Future<List<AmityCommunity>> get(params) {
    throw UnimplementedError();
  }

  StreamController<List<AmityCommunity>> listen(
      RequestBuilder<GetCommunityRequest> request) {
    final streamController = StreamController<List<AmityCommunity>>();
    communityRepo.listenCommunity(request).listen((event) async {
      await Stream.fromIterable(event).forEach((element) async {
        element = await communityComposerUsecase.get(element);
      });
      streamController.add(event);
    });
    // Trigger changes to the community cache to active the listener
    final communities = communityRepo.getCommunityEntities(request);
    if (communities.isEmpty) {
      streamController.add([]);
    } else {
      CommunityHiveEntity community = communities.first;
      communityRepo.saveCommunityEntity(community);
    }
    return streamController;
  }
}
