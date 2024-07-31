import 'package:amity_sdk/src/src.dart';
import 'package:hive/hive.dart';

part 'user_hive_entity_1.g.dart';

/// User Hive Entity
@HiveType(typeId: 1)
class UserHiveEntity extends EkoObject {
  /// User doc Id
  @HiveField(0)
  String? id;

  /// USer udid
  @HiveField(1)
  String? userId;

  /// User roles incase of the community
  @HiveField(2)
  List<String>? roles;

  /// User permisson incase of the community
  @HiveField(3)
  List<String>? permissions;

  /// User display name
  @HiveField(4)
  String? displayName;

  /// User description
  @HiveField(5)
  String? description;

  /// User avatar file id
  @HiveField(6)
  String? avatarFileId;

  /// User avatart url (direct Url)
  @HiveField(7)
  String? avatarCustomUrl;

  /// User path with networkid 
  @HiveField(8)
  String? path;

  /// User flag count
  @HiveField(9)
  int? flagCount;
  
  //  HashFlag hashFlag;
  /// User metadata
  @HiveField(10)
  Map<String, dynamic>? metadata;

  /// flag to check if user is deleted
  @HiveField(11)
  bool? isDeleted;

  /// flag to check if user ban globally
  @HiveField(12)
  bool? isGlobalBan;

  /// User Create time
  @HiveField(13)
  DateTime? createdAt;

  /// User Update time
  @HiveField(14)
  DateTime? updatedAt;

  /// Hash Flag
  @HiveField(15)
  Map<String, dynamic>? hashFlag;
  
  @override
  String? getId() {
    return id;
  }  

  UserHiveEntity({
    this.id,
    this.userId,
    this.roles,
    this.permissions,
    this.displayName,
    this.description,
    this.avatarFileId,
    this.avatarCustomUrl,
    this.path,
    this.flagCount,
    this.metadata,
    this.isDeleted,
    this.isGlobalBan,
    this.createdAt,
    this.updatedAt,
    this.hashFlag,
  });
}
