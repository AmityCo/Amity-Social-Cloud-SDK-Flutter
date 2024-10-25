import 'package:amity_sdk/src/domain/model/amity_ad/amity_ad_placement.dart';
import 'package:amity_sdk/src/domain/model/amity_ad/amity_advertiser.dart';
import 'package:amity_sdk/src/domain/model/amity_file/amity_file_info.dart';
import 'dart:convert';

class AmityAd {
  final String? adId;
  final String? name;
  final Map<String, dynamic>? adTarget;
  final String? advertiserId;
  AmityAdvertiser? advertiser;
  final String? image1_1FileId;
  final String? image9_16FileId;
  AmityImage? image1_1;
  AmityImage? image9_16;
  final String? headline;
  final String? description;
  final String? body;
  final String? callToAction;
  final String? callToActionUrl;
  final List<AmityAdPlacement>? placements;
  final DateTime? startAt;
  final DateTime? endAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AmityAd({
    required this.adId,
    required this.name,
    this.adTarget,
    this.advertiserId,
    this.advertiser,
    this.image1_1FileId,
    this.image9_16FileId,
    this.image1_1,
    this.image9_16,
    this.headline,
    this.description,
    this.body,
    this.callToAction,
    this.callToActionUrl,
    this.placements,
    this.startAt,
    this.endAt,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'adId': adId,
      'name': name,
      'adTarget': adTarget,
      'advertiserId': advertiserId,
      'advertiser': advertiser?.toJson(),
      'image1_1FileId': image1_1FileId,
      'image9_16FileId': image9_16FileId,
      'headline': headline,
      'description': description,
      'body': body,
      'callToAction': callToAction,
      'callToActionUrl': callToActionUrl,
      'placements': placements?.map((e) => e.value).toList(),
      'startAt': startAt?.toIso8601String(),
      'endAt': endAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
