// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_hive_entity_36.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PinHiveEntityAdapter extends TypeAdapter<PinHiveEntity> {
  @override
  final int typeId = 36;

  @override
  PinHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PinHiveEntity(
      pinId: fields[0] as String,
      referenceId: fields[1] as String,
      referenceType: fields[2] as String,
      placement: fields[3] as String,
      targetId: fields[4] as String,
      targetType: fields[5] as String,
      pinnedBy: fields[6] as String,
      pinnedAt: fields[7] as DateTime,
      lastPinsUpdatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PinHiveEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.pinId)
      ..writeByte(1)
      ..write(obj.referenceId)
      ..writeByte(2)
      ..write(obj.referenceType)
      ..writeByte(3)
      ..write(obj.placement)
      ..writeByte(4)
      ..write(obj.targetId)
      ..writeByte(5)
      ..write(obj.targetType)
      ..writeByte(6)
      ..write(obj.pinnedBy)
      ..writeByte(7)
      ..write(obj.pinnedAt)
      ..writeByte(8)
      ..write(obj.lastPinsUpdatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PinHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
