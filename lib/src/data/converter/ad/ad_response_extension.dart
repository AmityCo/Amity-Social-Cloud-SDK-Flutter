import 'package:amity_sdk/src/data/data_source/local/hive_entity/ad_hive_entity_32.dart';
import 'package:amity_sdk/src/data/response/ad_response.dart';

extension AdResponseExtension on AdResponse {
  AdHiveEntity toHiveEntity() {
    return AdHiveEntity()
      ..adId = adId
      ..advertiserId = advertiserId
      ..name = name
      ..placements = placements
      ..headline = headline
      ..description = description
      ..body = body
      ..image1_1 = image1_1
      ..image9_16 = image9_16
      ..callToAction = callToAction
      ..callToActionUrl = callToActionUrl
      ..target = target
      ..startAt = startAt
      ..endAt = endAt
      ..createdAt = createdAt
      ..updatedAt = updatedAt;
  }
}
