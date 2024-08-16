// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_member_hive_entity_14.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityMemberHiveEntityAdapter
    extends TypeAdapter<CommunityMemberHiveEntity> {
  @override
  final int typeId = 14;

  @override
  CommunityMemberHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityMemberHiveEntity(
      id: fields[0] as String?,
      communityId: fields[1] as String?,
      channelId: fields[2] as String?,
      userId: fields[3] as String?,
      communityMembership: fields[4] as String?,
      roles: (fields[5] as List?)?.cast<String>(),
      permissions: (fields[6] as List?)?.cast<String>(),
      isBanned: fields[7] as bool?,
      isDeleted: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityMemberHiveEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.communityId)
      ..writeByte(2)
      ..write(obj.channelId)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.communityMembership)
      ..writeByte(5)
      ..write(obj.roles)
      ..writeByte(6)
      ..write(obj.permissions)
      ..writeByte(7)
      ..write(obj.isBanned)
      ..writeByte(8)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityMemberHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
