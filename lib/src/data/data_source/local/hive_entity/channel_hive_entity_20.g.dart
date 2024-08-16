// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_hive_entity_20.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChannelHiveEntityAdapter extends TypeAdapter<ChannelHiveEntity> {
  @override
  final int typeId = 20;

  @override
  ChannelHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChannelHiveEntity(
      channelId: fields[0] as String?,
      isDistinct: fields[1] as bool?,
      metadata: (fields[2] as Map?)?.cast<String, dynamic>(),
      type: fields[3] as String?,
      tags: (fields[4] as List?)?.cast<String>(),
      isMuted: fields[5] as bool?,
      isRateLimited: fields[6] as bool?,
      muteTimeout: fields[7] as DateTime?,
      rateLimit: fields[8] as int?,
      rateLimitWindow: fields[9] as int?,
      rateLimitTimeout: fields[10] as DateTime?,
      displayName: fields[11] as String?,
      messageAutoDeleteEnabled: fields[12] as bool?,
      autoDeleteMessageByFlagLimit: fields[13] as int?,
      memberCount: fields[14] as int?,
      messageCount: fields[15] as int?,
      lastActivity: fields[16] as DateTime?,
      createdAt: fields[17] as DateTime?,
      updatedAt: fields[18] as DateTime?,
      avatarFileId: fields[19] as String?,
      isDeleted: fields[20] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ChannelHiveEntity obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.channelId)
      ..writeByte(1)
      ..write(obj.isDistinct)
      ..writeByte(2)
      ..write(obj.metadata)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.isMuted)
      ..writeByte(6)
      ..write(obj.isRateLimited)
      ..writeByte(7)
      ..write(obj.muteTimeout)
      ..writeByte(8)
      ..write(obj.rateLimit)
      ..writeByte(9)
      ..write(obj.rateLimitWindow)
      ..writeByte(10)
      ..write(obj.rateLimitTimeout)
      ..writeByte(11)
      ..write(obj.displayName)
      ..writeByte(12)
      ..write(obj.messageAutoDeleteEnabled)
      ..writeByte(13)
      ..write(obj.autoDeleteMessageByFlagLimit)
      ..writeByte(14)
      ..write(obj.memberCount)
      ..writeByte(15)
      ..write(obj.messageCount)
      ..writeByte(16)
      ..write(obj.lastActivity)
      ..writeByte(17)
      ..write(obj.createdAt)
      ..writeByte(18)
      ..write(obj.updatedAt)
      ..writeByte(19)
      ..write(obj.avatarFileId)
      ..writeByte(20)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChannelHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
