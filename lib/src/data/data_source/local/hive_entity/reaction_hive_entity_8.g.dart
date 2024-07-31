// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction_hive_entity_8.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReactionHiveEntityAdapter extends TypeAdapter<ReactionHiveEntity> {
  @override
  final int typeId = 8;

  @override
  ReactionHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReactionHiveEntity(
      reactionId: fields[0] as String?,
      reactionName: fields[1] as String?,
      userId: fields[2] as String?,
      userDisplayName: fields[3] as String?,
      referenceId: fields[4] as String?,
      referenceType: fields[5] as String?,
      createdAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ReactionHiveEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.reactionId)
      ..writeByte(1)
      ..write(obj.reactionName)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.userDisplayName)
      ..writeByte(4)
      ..write(obj.referenceId)
      ..writeByte(5)
      ..write(obj.referenceType)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReactionHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
