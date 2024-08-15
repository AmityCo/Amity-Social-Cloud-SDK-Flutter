// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging_id_hive_entity_29.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PagingIdHiveEntityAdapter extends TypeAdapter<PagingIdHiveEntity> {
  @override
  final int typeId = 29;

  @override
  PagingIdHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PagingIdHiveEntity(
      id: fields[0] as String?,
      hash: fields[1] as int?,
      nonce: fields[2] as int?,
      position: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PagingIdHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.hash)
      ..writeByte(2)
      ..write(obj.nonce)
      ..writeByte(3)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagingIdHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
