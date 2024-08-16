// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_hive_entity_9.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityHiveEntityAdapter extends TypeAdapter<CommunityHiveEntity> {
  @override
  final int typeId = 9;

  @override
  CommunityHiveEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityHiveEntity(
      communityId: fields[0] as String?,
      path: fields[1] as String?,
      channelId: fields[2] as String?,
      userId: fields[3] as String?,
      displayName: fields[4] as String?,
      description: fields[5] as String?,
      avatarFileId: fields[6] as String?,
      isOfficial: fields[7] as bool?,
      isPublic: fields[8] as bool?,
      onlyAdminCanPost: fields[9] as bool?,
      metadata: (fields[10] as Map?)?.cast<String, dynamic>(),
      postCount: fields[11] as int?,
      membersCount: fields[12] as int?,
      isJoined: fields[13] as bool?,
      isDeleted: fields[14] as bool?,
      needApprovalOnPostCreation: fields[15] as bool?,
      createdAt: fields[16] as DateTime?,
      editedAt: fields[17] as DateTime?,
      categoryIds: (fields[18] as List?)?.cast<String>(),
      tags: (fields[19] as List?)?.cast<String>(),
      allowCommentInStory: fields[20] as bool?,
      queryTimestamp: fields[21] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityHiveEntity obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.communityId)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.channelId)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.displayName)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.avatarFileId)
      ..writeByte(7)
      ..write(obj.isOfficial)
      ..writeByte(8)
      ..write(obj.isPublic)
      ..writeByte(9)
      ..write(obj.onlyAdminCanPost)
      ..writeByte(10)
      ..write(obj.metadata)
      ..writeByte(11)
      ..write(obj.postCount)
      ..writeByte(12)
      ..write(obj.membersCount)
      ..writeByte(13)
      ..write(obj.isJoined)
      ..writeByte(14)
      ..write(obj.isDeleted)
      ..writeByte(15)
      ..write(obj.needApprovalOnPostCreation)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.editedAt)
      ..writeByte(18)
      ..write(obj.categoryIds)
      ..writeByte(19)
      ..write(obj.tags)
      ..writeByte(20)
      ..write(obj.allowCommentInStory)
      ..writeByte(21)
      ..write(obj.queryTimestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityHiveEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
