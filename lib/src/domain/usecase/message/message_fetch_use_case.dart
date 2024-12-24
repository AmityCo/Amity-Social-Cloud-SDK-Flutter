import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [MessageFetchUseCase]
class MessageFetchUseCase extends UseCase<
    PageListData<List<AmityMessage>, String>, MessageQueryRequest> {
  /// Message Repo
  final MessageRepo messageRepo;

  /// init [MessageFetchUseCase]
  MessageFetchUseCase(
      {required this.messageRepo});

  @override
  Future<PageListData<List<AmityMessage>, String>> get(
      MessageQueryRequest params) async {
    return messageRepo.queryMesssage(params);
  }
}
