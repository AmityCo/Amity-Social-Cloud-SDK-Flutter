import 'package:amity_sdk/src/src.dart';
import 'package:hive/hive.dart';

part 'file_hive_entity_4.g.dart';

@HiveType(typeId: 4)

/// [FileHiveEntity]
class FileHiveEntity  extends EkoObject{
  /// File Doc ID
  @HiveField(0)
  String? fileId;

  /// Remote File Url
  @HiveField(1)
  String? fileUrl;

  /// Local File path for preview
  @HiveField(2)
  String? filePath;

  @HiveField(3)
  String? type;

  @HiveField(4)
  DateTime? createdAt;

  @HiveField(5)
  DateTime? updatedAt;

  @HiveField(6)
  Map<String, dynamic>? rawFile;

  //Attribute
  @HiveField(7)
  String? name;

  @HiveField(8)
  String? ext;

  @HiveField(9)
  String? size;

  @HiveField(10)
  String? mimeType;

  //Metadata
  @HiveField(11)
  int? height;
  
  @HiveField(12)
  int? width;

  @HiveField(13)
  bool? isFull;
  
  @override
  String? getId() {
    return fileId;
  }

  FileHiveEntity({
    this.fileId,
    this.fileUrl,
    this.filePath,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.rawFile,
    this.name,
    this.ext,
    this.size,
    this.mimeType,
    this.height,
    this.width,
    this.isFull,
  });
}
