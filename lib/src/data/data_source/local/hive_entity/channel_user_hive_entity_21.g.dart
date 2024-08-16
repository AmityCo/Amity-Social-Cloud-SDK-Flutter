// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_user_hive_entity_21.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChannelUserHiveEntityAdapter extends TypeAdapter<ChannelUserHiveEntity> {
  @override
  final int typeId = 21;

  @override
  ChannelUserHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChannelUserHiveEntity(
      id: fields[0] as String?,
      userId: fields[1] as String?,
      channelId: fields[2] as String?,
      membership: fields[3] as String?,
      isBanned: fields[4] as bool?,
      lastActivity: fields[5] as DateTime?,
      roles: (fields[6] as List?)?.cast<String>(),
      permissions: (fields[7] as List?)?.cast<String>(),
      readToSegment: fields[8] as int?,
      lastMentionedSegment: fields[9] as int?,
      isDeleted: fields[10] as bool?,
      isMuted: fields[11] as bool?,
      muteTimeout: fields[12] as DateTime?,
      createdAt: fields[13] as DateTime?,
      updatedAt: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ChannelUserHiveEntity obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.channelId)
      ..writeByte(3)
      ..write(obj.membership)
      ..writeByte(4)
      ..write(obj.isBanned)
      ..writeByte(5)
      ..write(obj.lastActivity)
      ..writeByte(6)
      ..write(obj.roles)
      ..writeByte(7)
      ..write(obj.permissions)
      ..writeByte(8)
      ..write(obj.readToSegment)
      ..writeByte(9)
      ..write(obj.lastMentionedSegment)
      ..writeByte(10)
      ..write(obj.isDeleted)
      ..writeByte(11)
      ..write(obj.isMuted)
      ..writeByte(12)
      ..write(obj.muteTimeout)
      ..writeByte(13)
      ..write(obj.createdAt)
      ..writeByte(14)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelUserHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
