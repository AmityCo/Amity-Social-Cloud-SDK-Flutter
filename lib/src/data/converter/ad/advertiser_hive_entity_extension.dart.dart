

import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';

extension AdvertiserHiveEntityExtension on AdvertiserHiveEntity {
  AmityAdvertiser covertToAmityAdvertiser() {
    return AmityAdvertiser(
      advertiserId: advertiserId,
      name: name,
      companyName: companyName,
      avatarFileId: avatarFileId,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}
