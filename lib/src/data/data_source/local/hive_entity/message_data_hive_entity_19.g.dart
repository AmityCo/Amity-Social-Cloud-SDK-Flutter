// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data_hive_entity_19.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageDataHiveEntityAdapter extends TypeAdapter<MessageDataHiveEntity> {
  @override
  final int typeId = 19;

  @override
  MessageDataHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageDataHiveEntity()
      ..text = fields[0] as String?
      ..fileId = fields[1] as String?
      ..caption = fields[2] as String?
      ..thumbnailFileId = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, MessageDataHiveEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.fileId)
      ..writeByte(2)
      ..write(obj.caption)
      ..writeByte(3)
      ..write(obj.thumbnailFileId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageDataHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
