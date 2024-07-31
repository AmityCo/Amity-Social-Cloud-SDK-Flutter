// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_member_paging_hive_entity_15.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityMemberPagingHiveEntityAdapter
    extends TypeAdapter<CommunityMemberPagingHiveEntity> {
  @override
  final int typeId = 15;

  @override
  CommunityMemberPagingHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityMemberPagingHiveEntity(
      id: fields[0] as String?,
      communityMemberIds: (fields[1] as List?)?.cast<String>(),
      nextToken: fields[2] as String?,
      prevToken: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityMemberPagingHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.communityMemberIds)
      ..writeByte(2)
      ..write(obj.nextToken)
      ..writeByte(3)
      ..write(obj.prevToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityMemberPagingHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
