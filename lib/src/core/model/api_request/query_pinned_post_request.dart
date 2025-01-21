import 'package:amity_sdk/src/core/utils/amity_nonce.dart';

class QueryPinnedPostRequest {
  final String targetId;
  final String targetType;
  final String? placement;

  QueryPinnedPostRequest({
    required this.targetId,
    required this.targetType,
    this.placement,
  });

  factory QueryPinnedPostRequest.fromJson(Map<String, dynamic> json) =>
      QueryPinnedPostRequest(
        targetId: json['targetId'],
        targetType: json['targetType'],
        placement: json['placement'],
      );

  Map<String, dynamic> toJson() {
    return {
      'targetId': targetId,
      'targetType': targetType,
      'placement': placement,
    }..removeWhere((key, value) => value == null);
  }

  int getHashCode() {
    final jsonString = (toJson()..remove('options')).toString();
    return jsonString.hashCode;
  }

  AmityNonce getNonce() {
    return AmityNonce.PINNED_POST_LIST;
  }

}
