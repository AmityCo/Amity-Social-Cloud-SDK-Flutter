import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// Close Poll Use Case
class ClosePollUseCase extends UseCase<AmityPoll, PollVoteRequest> {
  /// Poll Repo
  final PollRepo pollRepo;

  /// Init Close Post Usecase
  ClosePollUseCase({required this.pollRepo});

  @override
  Future<AmityPoll> get(PollVoteRequest params) {
    return pollRepo.closePoll(params);
  }
}
