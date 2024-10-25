import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/repo/sub_channel_repo.dart';

class SubChannelGetByIdUsecase
    extends UseCase<AmitySubChannel, String> {
  final SubChannelRepo subChannelRepo;
  SubChannelGetByIdUsecase({required this.subChannelRepo,});

  @override
  Future<AmitySubChannel> get(
      String params) async {
    final amitysubChannel = await subChannelRepo.getSubChannel(params);
    return amitysubChannel;
  }
}