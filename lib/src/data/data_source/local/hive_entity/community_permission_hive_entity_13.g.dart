// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_permission_hive_entity_13.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityPermissionHiveEntityAdapter
    extends TypeAdapter<CommunityPermissionHiveEntity> {
  @override
  final int typeId = 25;

  @override
  CommunityPermissionHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityPermissionHiveEntity(
      id: fields[0] as String?,
      communityId: fields[1] as String?,
      userId: fields[2] as String?,
      permissionName: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityPermissionHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.communityId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.permissionName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityPermissionHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
