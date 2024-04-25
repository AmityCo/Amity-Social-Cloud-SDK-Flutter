import 'package:amity_sdk/amity_sdk.dart';

class StoryTargetSearchInfo{
  String targetId;
  AmityStoryTargetType targetType;
  StoryTargetSearchInfo({required this.targetId, required this.targetType});

  Map<String, dynamic> toJson() {
    return {
      'targetId': targetId,
      'targetType': targetType.value,
    };
  }

  factory StoryTargetSearchInfo.fromJson(Map<String, dynamic> json) {
    return StoryTargetSearchInfo(
      targetId: json['targetId'],
      targetType: json['targetType'],
    );
  }
  
}