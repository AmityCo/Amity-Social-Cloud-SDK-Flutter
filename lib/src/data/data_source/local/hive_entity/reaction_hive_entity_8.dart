// ignore_for_file: hash_and_equals

import 'package:amity_sdk/src/core/utils/amity_hive_type.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:hive/hive.dart';

part 'reaction_hive_entity_8.g.dart';

@HiveType(typeId: AmityHiveType.reaction)
class ReactionHiveEntity extends EkoObject {
  @HiveField(0)
  String? reactionId;

  @HiveField(1)
  String? reactionName;

  @HiveField(2)
  String? userId;

  @HiveField(3)
  String? userDisplayName;

  @HiveField(4)
  String? referenceId;

  @HiveField(5)
  String? referenceType;

  @HiveField(6)
  DateTime? createdAt;

  ReactionHiveEntity({
    this.reactionId,
    this.reactionName,
    this.userId,
    this.userDisplayName,
    this.referenceId,
    this.referenceType,
    this.createdAt,
  });

  @override
  int get hashCode => Object.hash(
      referenceType, referenceId, reactionName, userId, userDisplayName);
      
        @override
        String? getId() {
          return "$referenceType$referenceId$reactionName$userId";
        }
}
