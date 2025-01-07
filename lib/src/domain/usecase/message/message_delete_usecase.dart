import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [MessageDeleteUsecase]
class MessageDeleteUsecase extends UseCase<void, String> {
  /// Message Repo
  final MessageRepo messageRepo;

  /// Init [MessageDeleteUsecase]
  MessageDeleteUsecase({required this.messageRepo});

  @override
  Future get(String params) async {
    try {
      await messageRepo.deleteMessage(params);
    } catch (e) {
      return Future.error(e);
    }
  }
}
