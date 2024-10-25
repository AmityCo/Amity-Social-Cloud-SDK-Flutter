import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_network_ads.dart';
import 'package:amity_sdk/src/domain/usecase/ads/get_advertiser_use_case.dart';
import 'package:amity_sdk/src/domain/usecase/file/get_image_use_case.dart';

class NetworkAdsComposerUseCase
    extends UseCase<AmityNetworkAds, AmityNetworkAds> {
  /// File Repo
  final FileRepo fileRepo;

  /// Init [NetworkAdsComposerUseCase]
  NetworkAdsComposerUseCase({required this.fileRepo});

  @override
  Future<AmityNetworkAds> get(AmityNetworkAds networkAds) async {
    await addLinkedObjects(networkAds);
    return networkAds;
  }

  Future<void> addLinkedObjects(AmityNetworkAds networkAds) async {
    if (networkAds.getAds() != null) {
      for (var ad in networkAds.getAds()!) {
        ad.advertiser =
            await serviceLocator<GetAdvertiserUseCase>().get(ad.advertiserId);
        if (ad.image1_1FileId != null) {
          ad.image1_1 =
              await serviceLocator<GetImageUseCase>().get(ad.image1_1FileId!);
        }
        if (ad.image9_16FileId != null) {
          ad.image9_16 =
              await serviceLocator<GetImageUseCase>().get(ad.image9_16FileId!);
        }
      }
    }
  }
}
