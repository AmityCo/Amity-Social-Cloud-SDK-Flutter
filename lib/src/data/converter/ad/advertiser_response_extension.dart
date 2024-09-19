import 'package:amity_sdk/src/data/data_source/local/hive_entity/advertiser_hive_entity_33.dart';
import 'package:amity_sdk/src/data/response/advertiser_response.dart';

extension AdvertiserResponseExtension on AdvertiserResponse {
  AdvertiserHiveEntity toHiveEntity() {
    return AdvertiserHiveEntity()
      ..advertiserId = advertiserId
      ..name = name
      ..companyName = companyName
      ..avatarFileId = avatarFileId
      ..createdAt = createdAt
      ..updatedAt = updatedAt;
  }
}
