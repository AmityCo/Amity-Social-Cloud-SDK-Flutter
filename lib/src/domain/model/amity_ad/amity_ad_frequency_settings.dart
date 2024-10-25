import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad_frequency.dart';

class AmityFrequencySettings {
  final Map<String, dynamic> frequency;

  AmityFrequencySettings({
    required this.frequency,
  });

  factory AmityFrequencySettings.fromJson(Map<String, dynamic> json) {
    return AmityFrequencySettings(
      frequency: json,
    );
  }

  Map<String, dynamic> toJson() {
    return frequency;
  }

  AmityAdFrequency getFeedAdFrequency() {
    return AmityAdFrequency.fromJson(frequency['feed']);
  }

  AmityAdFrequency getStoryAdFrequency() {
    return AmityAdFrequency.fromJson(frequency['story']);
  }

  AmityAdFrequency getCommentAdFrequency() {
    return AmityAdFrequency.fromJson(frequency['comment']);
  }
}
