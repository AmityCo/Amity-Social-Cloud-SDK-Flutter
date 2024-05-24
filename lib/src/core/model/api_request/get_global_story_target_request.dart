import 'package:amity_sdk/src/core/core.dart';

class GetGlobalStoryTargetRequest{
  int? limit;
  String? token;
  String? seenState;
  bool isSmartState = false;
  GetGlobalStoryTargetRequest({this.limit, this.token , this.seenState});

  GetGlobalStoryTargetRequest.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    token = json['token'];
    seenState = json['seenState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['token'] = token;
    data['seenState'] = seenState;
    return data..removeNullValue();
  }
}