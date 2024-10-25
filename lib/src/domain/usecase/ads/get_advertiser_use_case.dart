import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/composer_usecase/advertiser_compose_use_case.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';
import 'package:amity_sdk/src/domain/repo/ad_repo.dart';

class GetAdvertiserUseCase extends UseCase<AmityAdvertiser?, String?> {
  final AdRepository adRepo;

  GetAdvertiserUseCase({required this.adRepo});

  @override
  Future<AmityAdvertiser?> get(String? advertiserId) async {
    if (advertiserId == null) {
      return null;
    }
    final advertiser = await adRepo.getAdvertiser(advertiserId);
    return advertiser != null
        ? await serviceLocator<AdvertiserComposerUseCase>().execute(advertiser)
        : null;
  }
}
