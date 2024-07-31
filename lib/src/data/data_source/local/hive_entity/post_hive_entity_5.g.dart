// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_hive_entity_5.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostHiveEntityAdapter extends TypeAdapter<PostHiveEntity> {
  @override
  final int typeId = 5;

  @override
  PostHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostHiveEntity(
      id: fields[0] as String?,
      path: fields[1] as String?,
      postId: fields[2] as String?,
      parentPostId: fields[3] as String?,
      postedUserId: fields[4] as String?,
      sharedUserId: fields[5] as String?,
      sharedCount: fields[6] as int?,
      targetId: fields[7] as String?,
      targetType: fields[8] as String?,
      dataType: fields[9] as String?,
      data: fields[10] as PostChildDataHiveEntity?,
      metadata: (fields[11] as Map?)?.cast<String, dynamic>(),
      flagCount: fields[12] as int?,
      hashFlag: (fields[13] as Map?)?.cast<String, dynamic>(),
      editedAt: fields[14] as DateTime?,
      createdAt: fields[15] as DateTime?,
      updatedAt: fields[16] as DateTime?,
      reactions: (fields[17] as Map?)?.cast<String, int>(),
      reactionsCount: fields[18] as int?,
      myReactions: (fields[19] as List?)?.cast<String>(),
      commentsCount: fields[20] as int?,
      comments: (fields[21] as List?)?.cast<String>(),
      children: (fields[22] as List?)?.cast<String>(),
      isDeleted: fields[23] as bool?,
      hasFlaggedComment: fields[24] as bool?,
      hasFlaggedChildren: fields[25] as bool?,
      feedId: fields[26] as String?,
      feedType: fields[27] as String?,
      require: fields[28] as String?,
      flaggedByMe: fields[29] as bool?,
      mentionees: (fields[32] as List?)?.cast<Mentionee>(),
      impression: fields[30] as int?,
      reach: fields[31] as int?,
      rawData: (fields[33] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostHiveEntity obj) {
    writer
      ..writeByte(34)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.postId)
      ..writeByte(3)
      ..write(obj.parentPostId)
      ..writeByte(4)
      ..write(obj.postedUserId)
      ..writeByte(5)
      ..write(obj.sharedUserId)
      ..writeByte(6)
      ..write(obj.sharedCount)
      ..writeByte(7)
      ..write(obj.targetId)
      ..writeByte(8)
      ..write(obj.targetType)
      ..writeByte(9)
      ..write(obj.dataType)
      ..writeByte(10)
      ..write(obj.data)
      ..writeByte(11)
      ..write(obj.metadata)
      ..writeByte(12)
      ..write(obj.flagCount)
      ..writeByte(13)
      ..write(obj.hashFlag)
      ..writeByte(14)
      ..write(obj.editedAt)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.reactions)
      ..writeByte(18)
      ..write(obj.reactionsCount)
      ..writeByte(19)
      ..write(obj.myReactions)
      ..writeByte(20)
      ..write(obj.commentsCount)
      ..writeByte(21)
      ..write(obj.comments)
      ..writeByte(22)
      ..write(obj.children)
      ..writeByte(23)
      ..write(obj.isDeleted)
      ..writeByte(24)
      ..write(obj.hasFlaggedComment)
      ..writeByte(25)
      ..write(obj.hasFlaggedChildren)
      ..writeByte(26)
      ..write(obj.feedId)
      ..writeByte(27)
      ..write(obj.feedType)
      ..writeByte(28)
      ..write(obj.require)
      ..writeByte(29)
      ..write(obj.flaggedByMe)
      ..writeByte(30)
      ..write(obj.impression)
      ..writeByte(31)
      ..write(obj.reach)
      ..writeByte(32)
      ..write(obj.mentionees)
      ..writeByte(33)
      ..write(obj.rawData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
