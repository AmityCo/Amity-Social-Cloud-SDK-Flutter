import 'dart:convert';

import 'package:amity_sdk/amity_sdk.dart';

class AmityAdvertiser {
  final String? advertiserId;
  final String? name;
  final String? companyName;
  final String? avatarFileId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  AmityImage? avatar;

  AmityAdvertiser({
    this.advertiserId,
    this.name,
    this.companyName,
    this.avatarFileId,
    this.createdAt,
    this.updatedAt,
  });

  factory AmityAdvertiser.fromJson(Map<String, dynamic> json) {
    return AmityAdvertiser(
      advertiserId: json['advertiserId'],
      name: json['name'],
      companyName: json['companyName'],
      avatarFileId: json['avatarFileId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'advertiserId': advertiserId,
      'name': name,
      'companyName': companyName,
      'avatarFileId': avatarFileId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
