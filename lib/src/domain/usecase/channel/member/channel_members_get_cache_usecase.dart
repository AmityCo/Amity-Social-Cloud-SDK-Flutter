import 'dart:async';

import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class ChannelGetMembersFromCacheUsecase
    extends UseCase<List<AmityChannelMember>, String> {

  final ChannelMemberRepo channelMemberRepo;

  final ChannelMemberComposerUsecase channelMemberComposerUsecase;

  ChannelGetMembersFromCacheUsecase(
      {required this.channelMemberRepo,
      required this.channelMemberComposerUsecase});

  @override
  Future<List<AmityChannelMember>> get(String channelId) async {
    final members = channelMemberRepo.getMembersFromCache(channelId);
    for (var member in members) {
      await channelMemberComposerUsecase.get(member);
    }
    return members;
  }
}
