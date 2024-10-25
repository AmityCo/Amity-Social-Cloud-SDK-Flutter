import 'package:amity_sdk/src/data/data_source/local/hive_entity/pin_hive_entity_35.dart';
import 'package:amity_sdk/src/data/response/pin_response.dart';
import 'package:amity_sdk/src/data/response/pin_target_response.dart';

extension PinResponsseExtension on PinResponse {
  /// convert [PinResponse] to [PinHiveEntity]
  PinHiveEntity convertToPinHiveEntity(PinTargetResponse target) {
    return PinHiveEntity(
      pinId: getId(target),
      referenceId: referenceId ?? '',
      referenceType: referenceType ?? '',
      placement: placement ?? '',
      targetId: target.targetId ?? '',
      targetType: target.targetType ?? '',
      pinnedBy: pinnedBy ?? '',
      pinnedAt: pinnedAt ?? DateTime.now(),
      lastPinsUpdatedAt: target.lastPinsUpdatedAt ?? DateTime.now(),
    );
  }
}
