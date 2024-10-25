// To parse this JSON data, do
//
//     final reactionRequest = reactionRequestFromJson(jsonString);

// ReactionRequest reactionRequestFromJson(String str) =>
//     ReactionRequest.fromJson(json.decode(str));

// String reactionRequestToJson(ReactionRequest data) =>
//     json.encode(data.toJson());

import 'package:amity_sdk/src/core/core.dart';

class ReactionRequest {
  ReactionRequest({
    required this.referenceId,
    required this.referenceType,
    required this.reactionName,
    this.referenceVersion,
  });

  final String referenceId;
  final String referenceType;
  final String reactionName;
  String? referenceVersion;

  factory ReactionRequest.fromJson(Map<String, dynamic> json) =>
      ReactionRequest(
        referenceId: json["referenceId"],
        referenceType: json["referenceType"],
        reactionName: json["reactionName"],
        referenceVersion:json["referenceVersion"],

      );

  Map<String, dynamic> toJson() => {
        "referenceId": referenceId,
        "referenceType": referenceType,
        "reactionName": reactionName,
        "referenceVersion": referenceVersion,
      }..removeNullValue();

  @override
  String toString() {
    return toJson().toJson();
  }
}
