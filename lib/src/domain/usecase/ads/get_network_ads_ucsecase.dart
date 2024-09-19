import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/composer_usecase/network_ads_composer_usecase.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_network_ads.dart';
import 'package:amity_sdk/src/domain/repo/ad_repo.dart';

class GetNetworkAdsUseCase extends UseCaseWithoutParam<AmityNetworkAds> {
  final AdRepository adRepo;

  GetNetworkAdsUseCase({required this.adRepo});

  @override
  Future<AmityNetworkAds> get() async {
    final networkAds = await adRepo.getNetworkAds();
    return serviceLocator<NetworkAdsComposerUseCase>().get(networkAds);
  }
}
