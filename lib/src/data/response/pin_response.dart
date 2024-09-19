import 'package:amity_sdk/src/data/response/pin_target_response.dart';

class PinResponse {
  String? referenceId;
  String? referenceType;
  String? placement;
  String? pinnedBy;
  DateTime? pinnedAt;

  PinResponse({
    this.referenceId,
    this.referenceType,
    this.placement,
    this.pinnedBy,
    this.pinnedAt,
  });

  String getId(PinTargetResponse target) {
		return "${referenceType}_${referenceId}_${placement}_${target.targetType}_${target.targetId}";
	}

  factory PinResponse.fromJson(Map<String, dynamic> json) {
    return PinResponse(
      referenceId: json["referenceId"],
      referenceType: json["referenceType"],
      placement: json["placement"],
      pinnedBy: json["pinnedBy"],
      pinnedAt: json["pinnedAt"] != null
          ? DateTime.parse(json["pinnedAt"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "referenceId": referenceId,
    "referenceType": referenceType,
    "placement": placement,
    "pinnedBy": pinnedBy,
    "pinnedAt": pinnedAt?.toIso8601String(),
  };
}
