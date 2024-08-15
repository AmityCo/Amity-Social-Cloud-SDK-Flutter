// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_category_hive_12.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityCategoryHiveEntityAdapter
    extends TypeAdapter<CommunityCategoryHiveEntity> {
  @override
  final int typeId = 12;

  @override
  CommunityCategoryHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityCategoryHiveEntity(
      categoryId: fields[0] as String?,
      name: fields[1] as String?,
      avatarFileId: fields[2] as String?,
      metadata: (fields[3] as Map?)?.cast<String, dynamic>(),
      isDeleted: fields[4] as bool?,
      createdAt: fields[5] as DateTime?,
      updatedAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityCategoryHiveEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.avatarFileId)
      ..writeByte(3)
      ..write(obj.metadata)
      ..writeByte(4)
      ..write(obj.isDeleted)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityCategoryHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
