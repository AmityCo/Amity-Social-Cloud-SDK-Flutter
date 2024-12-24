// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_hive_entity_18.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageHiveEntityAdapter extends TypeAdapter<MessageHiveEntity> {
  @override
  final int typeId = 18;

  @override
  MessageHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageHiveEntity(
      uniqueId: fields[0] as String?,
      messageId: fields[1] as String?,
      channelId: fields[2] as String?,
      userId: fields[4] as String?,
      type: fields[5] as String?,
      data: fields[6] as MessageDataHiveEntity?,
      subChannelId: fields[3] as String?,
      channelSegment: fields[7] as int?,
      parentId: fields[8] as String?,
      fileId: fields[9] as String?,
      tags: (fields[10] as List?)?.cast<String>(),
      metadata: (fields[11] as Map?)?.cast<String, dynamic>(),
      flagCount: fields[12] as int?,
      childrenNumber: fields[14] as int?,
      reactionsCount: fields[15] as int?,
      reactions: (fields[16] as Map?)?.cast<String, int>(),
      myReactions: (fields[17] as List?)?.cast<String>(),
      latestReaction: (fields[18] as Map?)?.cast<String, dynamic>(),
      isDeleted: fields[19] as bool?,
      createdAt: fields[20] as DateTime?,
      updatedAt: fields[21] as DateTime?,
      editedAt: fields[22] as DateTime?,
      mentionees: (fields[23] as List?)?.cast<Mentionee>(),
      syncState: fields[24] as String?,
      flaggedByMe: fields[25] as bool?,
    )..hashFlag = (fields[13] as Map?)?.cast<String, dynamic>();
  }

  @override
  void write(BinaryWriter writer, MessageHiveEntity obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.uniqueId)
      ..writeByte(1)
      ..write(obj.messageId)
      ..writeByte(2)
      ..write(obj.channelId)
      ..writeByte(3)
      ..write(obj.subChannelId)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.data)
      ..writeByte(7)
      ..write(obj.channelSegment)
      ..writeByte(8)
      ..write(obj.parentId)
      ..writeByte(9)
      ..write(obj.fileId)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.metadata)
      ..writeByte(12)
      ..write(obj.flagCount)
      ..writeByte(13)
      ..write(obj.hashFlag)
      ..writeByte(14)
      ..write(obj.childrenNumber)
      ..writeByte(15)
      ..write(obj.reactionsCount)
      ..writeByte(16)
      ..write(obj.reactions)
      ..writeByte(17)
      ..write(obj.myReactions)
      ..writeByte(18)
      ..write(obj.latestReaction)
      ..writeByte(19)
      ..write(obj.isDeleted)
      ..writeByte(20)
      ..write(obj.createdAt)
      ..writeByte(21)
      ..write(obj.updatedAt)
      ..writeByte(22)
      ..write(obj.editedAt)
      ..writeByte(23)
      ..write(obj.mentionees)
      ..writeByte(24)
      ..write(obj.syncState)
      ..writeByte(25)
      ..write(obj.flaggedByMe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
