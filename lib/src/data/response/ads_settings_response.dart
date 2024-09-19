class AdsSettingsResponse {
  final bool? isEnabled;
  final int? maxActiveAds;
  final Map<String, dynamic>? frequency;

  AdsSettingsResponse({
    required this.isEnabled,
    required this.maxActiveAds,
    required this.frequency,
  });

  factory AdsSettingsResponse.fromJson(Map<String, dynamic> json) =>
      AdsSettingsResponse(
          isEnabled: json['enabled'],
          maxActiveAds: json['maxActiveAds'],
          frequency: json['frequency']);

  Map<String, dynamic> toJson() => {
        'enabled': isEnabled,
        'maxActiveAds': maxActiveAds,
        'frequency': frequency
      };
}
