import 'package:amity_sdk/amity_sdk.dart';

class GetTargetsByTargetsRequest{
  final List<StoryTargetSearchInfo> targets;

  GetTargetsByTargetsRequest({required this.targets});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targets'] = targets.map((v) => v.toJson()).toList();
    return data;
  }
}