// To parse this JSON data, do
//
//     final amityErrorResponse = amityErrorResponseFromJson(jsonString);

import 'dart:convert';

AmityErrorResponse amityErrorResponseFromJson(String str) => AmityErrorResponse.fromJson(json.decode(str));

String amityErrorResponseToJson(AmityErrorResponse data) => json.encode(data.toJson());

class AmityErrorResponse {
  AmityErrorResponse({
    this.status,
    required this.message,
    required this.code,
    this.data,
  });

  String? status;
  final String message;
  final int code;
  dynamic data;

  factory AmityErrorResponse.fromJson(Map<String, dynamic> json) { 
    
    return AmityErrorResponse(
        status: json["status"],
        message: json["message"] ?? "Unknown error",
        code: json["code"] ?? 800000,
        data: json["data"],
      );
  }

  factory AmityErrorResponse.unknown() { 
    return AmityErrorResponse(
        message: "Unknown error",
        code: 800000,
      );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        // "data": data.toJson(),
      };
}

// class Data {
//   Data({
//     required this.detail,
//   });

//   final List<String>? detail;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         detail: json["detail"] == null
//             ? null
//             : List<String>.from(json["detail"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "detail":
//             detail == null ? null : List<dynamic>.from(detail!.map((x) => x)),
//       };
// }
