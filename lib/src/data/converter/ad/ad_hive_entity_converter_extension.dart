import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_hive_entity_32.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad_placement.dart';

extension AdHiveEntityExtension on AdHiveEntity {
  AmityAd convertToAmityAd() {
    return AmityAd(
      adId: adId,
      advertiserId: advertiserId,
      name: name,
      placements:
          placements?.map((e) => AmityAdPlacementExtension.enumOf(e)).toList(),
      headline: headline,
      description: description,
      body: body,
      image1_1FileId: image1_1,
      image9_16FileId: image9_16,
      callToAction: callToAction,
      callToActionUrl: callToActionUrl,
      adTarget: target,
      startAt: startAt,
      endAt: endAt,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}
