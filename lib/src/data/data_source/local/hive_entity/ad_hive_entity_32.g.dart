// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_hive_entity_32.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdHiveEntityAdapter extends TypeAdapter<AdHiveEntity> {
  @override
  final int typeId = 32;

  @override
  AdHiveEntity read(BinaryReader reader) {
    return AdHiveEntity();
  }

  @override
  void write(BinaryWriter writer, AdHiveEntity obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
