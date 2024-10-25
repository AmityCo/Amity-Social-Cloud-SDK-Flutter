// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_channel_hive_entity_35.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubChannelHiveEntityAdapter extends TypeAdapter<SubChannelHiveEntity> {
  @override
  final int typeId = 35;

  @override
  SubChannelHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubChannelHiveEntity();
  }

  @override
  void write(BinaryWriter writer, SubChannelHiveEntity obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubChannelHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
