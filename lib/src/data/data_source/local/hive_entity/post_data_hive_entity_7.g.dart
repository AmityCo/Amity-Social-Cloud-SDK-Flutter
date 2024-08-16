// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data_hive_entity_7.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostChildDataHiveEntityAdapter
    extends TypeAdapter<PostChildDataHiveEntity> {
  @override
  final int typeId = 7;

  @override
  PostChildDataHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostChildDataHiveEntity(
      text: fields[0] as String?,
      fileId: fields[1] as String?,
      thumbnailFileId: fields[2] as String?,
      videoFileId: (fields[3] as Map?)?.cast<String, String>(),
      streamId: fields[4] as String?,
      pollId: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PostChildDataHiveEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.fileId)
      ..writeByte(2)
      ..write(obj.thumbnailFileId)
      ..writeByte(3)
      ..write(obj.videoFileId)
      ..writeByte(4)
      ..write(obj.streamId)
      ..writeByte(5)
      ..write(obj.pollId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostChildDataHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
