import 'dart:convert';

import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad_frequency_settings.dart';

class AmityAdsSettings {
  final bool? isEnabled;
  final int? maxActiveAds;
  final Map<String, dynamic>? frequency;
  final DateTime? updatedAt;

  AmityAdsSettings({
    this.isEnabled,
    this.maxActiveAds,
    this.frequency,
    this.updatedAt,
  });

  factory AmityAdsSettings.fromJson(Map<String, dynamic> json) {
    return AmityAdsSettings(
      isEnabled: json['isEnabled'],
      maxActiveAds: json['maxActiveAds'],
      frequency: json['frequency'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  AmityFrequencySettings? getFrequency() {
    if (frequency != null) {
      return AmityFrequencySettings.fromJson(frequency!);
    } else {
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'isEnabled': isEnabled,
      'maxActiveAds': maxActiveAds,
      'frequency': frequency,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
