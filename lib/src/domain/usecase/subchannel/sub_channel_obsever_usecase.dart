import 'dart:async';

import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/core/model/api_request/get_sub_channels_request.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelObserverUseCase extends UseCase<List<AmitySubChannel>, GetSubChannelsRequest> {
  final SubChannelRepo subChannelRepo;

  SubChannelObserverUseCase({ required this.subChannelRepo});

  @override
  Future<List<AmitySubChannel>> get(GetSubChannelsRequest params) {
    throw UnimplementedError();
  }

  StreamController<List<AmitySubChannel>> listen(RequestBuilder<GetSubChannelsRequest> request) {
    final streamController = StreamController<List<AmitySubChannel>>();
    subChannelRepo.listenPosts(request).listen((event) async {
      streamController.add(event);
    });
    return streamController;
  }
}
