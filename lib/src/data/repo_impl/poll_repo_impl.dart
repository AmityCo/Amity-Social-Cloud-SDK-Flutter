import 'dart:async';

import 'package:amity_sdk/src/core/mapper/poll_model_mapper.dart';
import 'package:amity_sdk/src/core/model/api_request/create_poll_request.dart';
import 'package:amity_sdk/src/core/model/api_request/poll_vote_request.dart';
import 'package:amity_sdk/src/core/utils/model_mapper.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/model/amity_poll/amity_poll_post.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';
import 'package:amity_sdk/src/domain/repo/poll_repo.dart';

/// Poll Repo Impl
class PollRepoImpl extends PollRepo {
 
  @override
  bool isChildObjectType() {
    return true;
  }

  /// Common Db Adapter
  final DbAdapterRepo dbAdapterRepo;

  /// Poll Api Interface
  final PollApiInterface pollApiInterface;

  /// init Post Repo
  PollRepoImpl({required this.dbAdapterRepo, required this.pollApiInterface});

  @override
  Future<AmityPoll> getPollByIdFromDb(String pollId) async {
    return dbAdapterRepo.pollDbAdapter
        .getPollEntity(pollId)
        .convertToAmityPoll();
  }

  @override
  Future<AmityPoll> createPoll(CreatePollRequest request) async {
    final data = await pollApiInterface.createPoll(request);

    final amityPolls = await data.saveToDb<AmityPoll>(dbAdapterRepo);

    return (amityPolls as List).first;
  }

  @override
  Future<AmityPoll> votePoll(PollVoteRequest request) async {
    final data = await pollApiInterface.votePoll(request);

    /// this will update the poll hive entity and poll answer entity
    final amityPolls = await data.saveToDb<AmityPoll>(dbAdapterRepo);

    return (amityPolls as List).first;
  }

  @override
  Future<AmityPoll> deleteVotePoll(PollVoteRequest request) async {
    throw UnimplementedError();
    // final data = await pollApiInterface.deleteVotePoll(request);

    // final amityPolls = await data.saveToDb<AmityPoll>(dbAdapterRepo);

    // return (amityPolls as List).first;
  }

  @override
  Future<bool> deletePollById(String pollId) async {
    final data =
        await pollApiInterface.deleteVotePoll(PollVoteRequest(pollId: pollId));

    ///Get the post from DB and update the delete flag to true
    final amityPollDb = dbAdapterRepo.pollDbAdapter.getPollEntity(pollId);

    amityPollDb
      ..isDeleted = true
      ..save();

    return data;
  }

  @override
  Future<AmityPoll> closePoll(PollVoteRequest request) async {
    final data = await pollApiInterface.closePoll(request);
    final amityPolls = await data.saveToDb<AmityPoll>(dbAdapterRepo);

    return (amityPolls as List).first;
  }

  @override
  Future<AmityPoll?> fetchAndSave(String objectId) async {
    return await getPollByIdFromDb(objectId);
  }

  @override
  ModelMapper<PollHiveEntity, AmityPoll> mapper() {
    return PollModelMapper();
  }

  @override
  StreamController<PollHiveEntity> observeFromCache(String objectId) {
    final streamController = StreamController<PollHiveEntity>();
    dbAdapterRepo.pollDbAdapter.listenPollEntity(objectId).listen((event) {
      streamController.add(event);
    });
    return streamController;
  }

  @override
  Future<PollHiveEntity?> queryFromCache(String objectId) async {
    return dbAdapterRepo.pollDbAdapter.getPollEntity(objectId);
  }

}
