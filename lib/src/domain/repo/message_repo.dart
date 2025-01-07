import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/model/message/amity_message.dart';

/// Message Repo
abstract class MessageRepo {
  /// Query Message
  Future<PageListData<List<AmityMessage>, String>> queryMesssage(
      MessageQueryRequest request);

  /// Create Message
  Future<AmityMessage> createMessage(CreateMessageRequest request);

  /// Create Message
  Future<AmityMessage> updateMessage(CreateMessageRequest request);

  /// Get Message
  Future<AmityMessage> getMessage(String messageId);

  /// Delete Message
  Future deleteMessage(String messageId);

  /// Create File Message
  Future<AmityMessage> createFileMessage(CreateMessageRequest request);

  /// Listern Message
  Stream<List<AmityMessage>> listenMessages(
      RequestBuilder<MessageQueryRequest> request);

  List<MessageHiveEntity> getMessageEntities(
      RequestBuilder<MessageQueryRequest> request);

  /// Has Local Message
  bool hasLocalMessage(String messageId);

  /// Get local Message
  AmityMessage? getLocalMessage(String messageId);

  /// flag Message
  Future<AmityMessage> flagMessage(String messageId);

  /// unflag Message
  Future<AmityMessage> unFlagMessage(String messageId);
}
