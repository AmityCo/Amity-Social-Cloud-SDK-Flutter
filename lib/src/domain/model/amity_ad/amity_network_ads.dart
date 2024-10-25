import 'dart:convert';

import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_ads_settings.dart';

class AmityNetworkAds {
  final List<AmityAd>? ads;
  final AmityAdsSettings? settings;

  AmityNetworkAds(this.ads, this.settings);

  List<AmityAd>? getAds() {
    return ads;
  }

  AmityAdsSettings? getSettings() {
    return settings;
  }

  Map<String, dynamic> toMap() {
    return {
      'ads': ads?.map((e) => e.toJson()).toList(),
      'settings': settings?.toJson(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
