import 'package:hive/hive.dart';

part 'mentionee_hive_entity_30.g.dart';

@HiveType(typeId: 30)
class MentioneeHiveEntity extends HiveObject {

  /// Mentionee type
  @HiveField(0)
  final String type;

  /// Ids
  @HiveField(1)
  final List<String>? userIds;

  /// init [MentioneeHiveEntity]
  MentioneeHiveEntity({
    required this.type,
    this.userIds,
  });

  factory MentioneeHiveEntity.fromJson(Map<String, dynamic> json) => MentioneeHiveEntity(
        type: json["type"],
        userIds: json["userIds"] == null
            ? null
            : List<String>.from(json["userIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "userIds": List<dynamic>.from((userIds ?? []).map((x) => x)),
      };
}