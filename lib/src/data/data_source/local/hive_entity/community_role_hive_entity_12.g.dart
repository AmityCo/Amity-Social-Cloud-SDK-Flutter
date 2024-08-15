// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_role_hive_entity_12.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityRoleHiveEntityAdapter
    extends TypeAdapter<CommunityRoleHiveEntity> {
  @override
  final int typeId = 12;

  @override
  CommunityRoleHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityRoleHiveEntity(
      communityId: fields[0] as String?,
      userId: fields[1] as String?,
      roleName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityRoleHiveEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.communityId)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.roleName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityRoleHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
