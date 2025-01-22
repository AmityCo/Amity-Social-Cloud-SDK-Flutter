// To parse this JSON data, do
//
//     final sessionResponse = sessionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:amity_sdk/src/data/response/response.dart';

SessionResponse sessionResponseFromJson(String str) =>
    SessionResponse.fromJson(json.decode(str));

String sessionResponseToJson(SessionResponse data) =>
    json.encode(data.toJson());

class SessionResponse {
  SessionResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.users,
    required this.files,
    required this.issuedAt,
    required this.expiresAt,
  });

  final String accessToken;
  final String refreshToken;
  final List<UserResponse> users;
  final List<FileResponse> files;
  final DateTime? issuedAt;
  final DateTime? expiresAt;

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      SessionResponse(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        users: List<UserResponse>.from(
            json["users"].map((x) => UserResponse.fromJson(x))),
        files: List<FileResponse>.from(
            json["files"].map((x) => FileResponse.fromJson(x))),
        issuedAt: json["issuedAt"] == null
            ? null
            : DateTime.tryParse(json["issuedAt"]),
        expiresAt: json["expiresAt"] == null
            ? null
            : DateTime.tryParse(json["expiresAt"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "issuedAt": issuedAt?.toIso8601String(),
        "expiresAt": expiresAt?.toIso8601String(),
      };
}
