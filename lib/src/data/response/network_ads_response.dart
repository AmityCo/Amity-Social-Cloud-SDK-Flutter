import 'dart:convert';

import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/data/response/ad_response.dart';
import 'package:amity_sdk/src/data/response/ads_settings_response.dart';
import 'package:amity_sdk/src/data/response/advertiser_response.dart';

NetworkAdsResponse networkAdsResponseFromJson(String str) =>
    NetworkAdsResponse.fromJson(json.decode(str));

String networkAdsResponseToJson(NetworkAdsResponse data) =>
    json.encode(data.toJson());

class NetworkAdsResponse {
  NetworkAdsResponse({
    required this.ads,
    required this.settings,
    required this.files,
    required this.advertisers,
  });

  final List<AdResponse> ads;
  final AdsSettingsResponse settings;
  final List<FileResponse> files;
  final List<AdvertiserResponse> advertisers;

  factory NetworkAdsResponse.fromJson(Map<String, dynamic> json) =>
      NetworkAdsResponse(
        ads: List<AdResponse>.from(
            json['ads'].map((x) => AdResponse.fromJson(x))),
        settings: AdsSettingsResponse.fromJson(json['settings']),
        files: List<FileResponse>.from(
            json['files'].map((x) => FileResponse.fromJson(x))),
        advertisers: List<AdvertiserResponse>.from(
            json['advertisers'].map((x) => AdvertiserResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'ads': List<dynamic>.from(ads.map((x) => x.toJson())),
        'settings': settings.toJson(),
        'files': List<dynamic>.from(files.map((x) => x.toJson())),
        'advertisers': List<dynamic>.from(advertisers.map((x) => x.toJson())),
      };
}
