// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_hive_entity_4.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileHiveEntityAdapter extends TypeAdapter<FileHiveEntity> {
  @override
  final int typeId = 4;

  @override
  FileHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FileHiveEntity(
      fileId: fields[0] as String?,
      fileUrl: fields[1] as String?,
      filePath: fields[2] as String?,
      type: fields[3] as String?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      rawFile: (fields[6] as Map?)?.cast<String, dynamic>(),
      name: fields[7] as String?,
      ext: fields[8] as String?,
      size: fields[9] as String?,
      mimeType: fields[10] as String?,
      height: fields[11] as int?,
      width: fields[12] as int?,
      isFull: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, FileHiveEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.fileId)
      ..writeByte(1)
      ..write(obj.fileUrl)
      ..writeByte(2)
      ..write(obj.filePath)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.rawFile)
      ..writeByte(7)
      ..write(obj.name)
      ..writeByte(8)
      ..write(obj.ext)
      ..writeByte(9)
      ..write(obj.size)
      ..writeByte(10)
      ..write(obj.mimeType)
      ..writeByte(11)
      ..write(obj.height)
      ..writeByte(12)
      ..write(obj.width)
      ..writeByte(13)
      ..write(obj.isFull);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
