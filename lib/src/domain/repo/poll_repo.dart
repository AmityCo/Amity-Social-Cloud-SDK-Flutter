import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/data_source.dart';
import 'package:amity_sdk/src/domain/domain.dart';
import 'package:amity_sdk/src/domain/repo/amity_object_repository.dart';

/// Abs layer for Poll Repo
abstract class PollRepo extends AmityObjectRepository<PollHiveEntity, AmityPoll> {
  /// Get poll with pollId from Db
  Future<AmityPoll> getPollByIdFromDb(String pollId);

  /// Create Poll
  Future<AmityPoll> createPoll(CreatePollRequest request);

  /// Vote Poll
  Future<AmityPoll> votePoll(PollVoteRequest request);

  /// Delete Vote Poll
  Future<AmityPoll> deleteVotePoll(PollVoteRequest request);

  /// Delete Poll
  Future<bool> deletePollById(String pollId);

  /// Close  Poll
  Future<AmityPoll> closePoll(PollVoteRequest request);
}
