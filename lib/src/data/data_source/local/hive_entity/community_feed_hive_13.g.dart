// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_feed_hive_13.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityFeedHiveEntityAdapter
    extends TypeAdapter<CommunityFeedHiveEntity> {
  @override
  final int typeId = 13;

  @override
  CommunityFeedHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityFeedHiveEntity(
      feedId: fields[0] as String?,
      feedType: fields[1] as String?,
      targetId: fields[2] as String?,
      targetType: fields[3] as String?,
      postCount: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityFeedHiveEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.feedId)
      ..writeByte(1)
      ..write(obj.feedType)
      ..writeByte(2)
      ..write(obj.targetId)
      ..writeByte(3)
      ..write(obj.targetType)
      ..writeByte(4)
      ..write(obj.postCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityFeedHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
