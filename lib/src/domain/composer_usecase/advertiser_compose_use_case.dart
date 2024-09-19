import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';
import 'package:amity_sdk/src/domain/usecase/file/get_image_use_case.dart';

class AdvertiserComposerUseCase {
  final FileRepo fileRepo;

  AdvertiserComposerUseCase({required this.fileRepo});

  Future<AmityAdvertiser> execute(AmityAdvertiser advertiser) async {
    if (advertiser.avatarFileId != null) {
      advertiser.avatar =
          await serviceLocator<GetImageUseCase>().get(advertiser.avatarFileId!);
    }
    return advertiser;
  }
}
