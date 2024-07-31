// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hive_entity_1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserHiveEntityAdapter extends TypeAdapter<UserHiveEntity> {
  @override
  final int typeId = 1;

  @override
  UserHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserHiveEntity(
      id: fields[0] as String?,
      userId: fields[1] as String?,
      roles: (fields[2] as List?)?.cast<String>(),
      permissions: (fields[3] as List?)?.cast<String>(),
      displayName: fields[4] as String?,
      description: fields[5] as String?,
      avatarFileId: fields[6] as String?,
      avatarCustomUrl: fields[7] as String?,
      path: fields[8] as String?,
      flagCount: fields[9] as int?,
      metadata: (fields[10] as Map?)?.cast<String, dynamic>(),
      isDeleted: fields[11] as bool?,
      isGlobalBan: fields[12] as bool?,
      createdAt: fields[13] as DateTime?,
      updatedAt: fields[14] as DateTime?,
      hashFlag: (fields[15] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserHiveEntity obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.roles)
      ..writeByte(3)
      ..write(obj.permissions)
      ..writeByte(4)
      ..write(obj.displayName)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.avatarFileId)
      ..writeByte(7)
      ..write(obj.avatarCustomUrl)
      ..writeByte(8)
      ..write(obj.path)
      ..writeByte(9)
      ..write(obj.flagCount)
      ..writeByte(10)
      ..write(obj.metadata)
      ..writeByte(11)
      ..write(obj.isDeleted)
      ..writeByte(12)
      ..write(obj.isGlobalBan)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt)
      ..writeByte(15)
      ..write(obj.hashFlag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
