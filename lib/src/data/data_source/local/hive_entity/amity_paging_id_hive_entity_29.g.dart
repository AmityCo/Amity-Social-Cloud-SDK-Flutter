// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amity_paging_id_hive_entity_29.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AmityPagingIdHiveEntityAdapter
    extends TypeAdapter<AmityPagingIdHiveEntity> {
  @override
  final int typeId = 29;

  @override
  AmityPagingIdHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AmityPagingIdHiveEntity();
  }

  @override
  void write(BinaryWriter writer, AmityPagingIdHiveEntity obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AmityPagingIdHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
