class PinTargetResponse {
  String? targetId;
  String? targetType;
  DateTime? lastPinsUpdatedAt;

  PinTargetResponse({
    this.targetId,
    this.targetType,
    this.lastPinsUpdatedAt,
  });

  factory PinTargetResponse.fromJson(Map<String, dynamic> json) {
    return PinTargetResponse(
      targetId: json["targetId"],
      targetType: json["targetType"],
      lastPinsUpdatedAt: json["lastPinsUpdatedAt"] != null
          ? DateTime.parse(json["lastPinsUpdatedAt"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    "targetId": targetId,
    "targetType": targetType,
    "lastPinsUpdatedAt": lastPinsUpdatedAt?.toIso8601String(),
  };
}
