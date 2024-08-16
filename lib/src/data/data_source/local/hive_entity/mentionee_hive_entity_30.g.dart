// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentionee_hive_entity_30.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MentioneeHiveEntityAdapter extends TypeAdapter<MentioneeHiveEntity> {
  @override
  final int typeId = 30;

  @override
  MentioneeHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MentioneeHiveEntity(
      type: fields[0] as String,
      userIds: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MentioneeHiveEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.userIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MentioneeHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
