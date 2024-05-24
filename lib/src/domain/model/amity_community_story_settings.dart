import 'package:amity_sdk/src/core/extension/extension.dart';

class AmityCommunityStorySettings{
  bool? allowComment;

  AmityCommunityStorySettings({this.allowComment});

  factory AmityCommunityStorySettings.fromJson(Map<String, dynamic> json) {
    return AmityCommunityStorySettings(
      allowComment: json['allowComment'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allowComment'] = allowComment;
    return data..removeNullValue();
  }
}