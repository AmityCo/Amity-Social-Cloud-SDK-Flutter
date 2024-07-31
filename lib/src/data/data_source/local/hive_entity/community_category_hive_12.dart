import 'package:amity_sdk/src/src.dart';
import 'package:hive/hive.dart';

part 'community_category_hive_12.g.dart';

@HiveType(typeId: 12)
class CommunityCategoryHiveEntity extends  EkoObject {
  @HiveField(0)
  String? categoryId;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? avatarFileId;

  @HiveField(3)
  Map<String, dynamic>? metadata;

  @HiveField(4)
  bool? isDeleted;

  @HiveField(5)
  DateTime? createdAt;

  @HiveField(6)
  DateTime? updatedAt;

  CommunityCategoryHiveEntity({
    this.categoryId,
    this.name,
    this.avatarFileId,
    this.metadata,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });
  
  @override
  String? getId() {
    return categoryId;
  }
}
