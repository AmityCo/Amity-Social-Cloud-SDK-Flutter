import 'package:amity_sdk/src/data/response/core_response/story_target_response.dart';

class GetStoryTargetsByTargets {
  final List<StoryTargetResponse> storyTargets;

  GetStoryTargetsByTargets({required this.storyTargets});

  factory GetStoryTargetsByTargets.fromJson(Map<String, dynamic> json) =>
      GetStoryTargetsByTargets(
        storyTargets: json["storyTargets"] == null
            ? []
            : List<StoryTargetResponse>.from(json["storyTargets"]
                .map((x) => StoryTargetResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "storyTargets": List<dynamic>.from(storyTargets.map((x) => x.toJson())),
      };
}
