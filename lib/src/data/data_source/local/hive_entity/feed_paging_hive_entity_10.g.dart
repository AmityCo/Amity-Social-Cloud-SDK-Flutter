// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_paging_hive_entity_10.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedPagingHiveEntityAdapter extends TypeAdapter<FeedPagingHiveEntity> {
  @override
  final int typeId = 10;

  @override
  FeedPagingHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedPagingHiveEntity(
      id: fields[0] as String?,
      postIds: (fields[1] as List?)?.cast<String>(),
      nextToken: fields[2] as String?,
      prevToken: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FeedPagingHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.postIds)
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
      other is FeedPagingHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
