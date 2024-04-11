// To parse this JSON data, do
//
//     final getCommentRequest = getCommentRequestFromJson(jsonString);

import 'dart:convert';

import 'package:amity_sdk/src/core/model/api_request/core/option_request.dart';

GetCommentRequest getCommentRequestFromJson(String str) =>
    GetCommentRequest.fromJson(json.decode(str));
    
String getCommentRequestToJson(GetCommentRequest data) => json.encode(data.toJson());

class GetCommentRequest {
  GetCommentRequest({
    required this.referenceId,
    required this.referenceType,
    this.filterByParentId,
    this.parentId,
    this.hasFlag,
    this.isDeleted,
    this.sortBy,
    this.options,
    this.dataTypes,
    this.matchType
  });

  final String referenceId;
  final String referenceType;
  bool? filterByParentId;
  String? parentId;
  bool? hasFlag;
  dynamic isDeleted;
  String? sortBy;
  OptionsRequest? options;

  List<String>? dataTypes;
  String? matchType;

  factory GetCommentRequest.fromJson(Map<String, dynamic> json) => GetCommentRequest(
        referenceId: json["referenceId"],
        referenceType: json["referenceType"],
        filterByParentId: json["filterByParentId"],
        parentId: json["parentId"],
        hasFlag: json["hasFlag"],
        isDeleted: json["isDeleted"],
        sortBy: json["sortBy"],
        options: OptionsRequest.fromJson(json["options"]),
        dataTypes: List<String>.from(json["dataTypes"].map((x) => x)),
        matchType: json["matchType"],
      );

  Map<String, dynamic> toJson() => {
        "referenceId": referenceId,
        "referenceType": referenceType,
        "filterByParentId": filterByParentId,
        "parentId": parentId,
        "hasFlag": hasFlag,
        "isDeleted": isDeleted,
        "sortBy": sortBy,
        "options": options?.toJson(),
        "dataTypes[values][]": dataTypes == null ? null : List<String>.from(dataTypes!.map((x) => x)),
        "dataTypes[matchType]": matchType,
      }..removeWhere((key, value) => value == null);

  @override
  String toString() => 'GetCommentRequest(referenceId: $referenceId, referenceType: $referenceType)';
}

// class DataTypes {
//   final List<String> values;
//   final String matchType;

//   DataTypes({
//     required this.values,
//     required this.matchType,
//   });

//   factory DataTypes.fromJson(Map<String, dynamic> json) => DataTypes(
//         values: List<String>.from(json["values"].map((x) => x)),
//         matchType: json["matchType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "values[]": List<String>.from(values.map((x) => x)),
//         "matchType": matchType,
//       };
// }
