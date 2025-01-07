import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data_source/local/hive_entity/message_hive_entity_18.dart';

/// Message Collection Adater
abstract class MessageDbAdapter {
  /// Save Message Entity
  Future saveMessageEntity(MessageHiveEntity data);

  /// Delete Message Entity
  Future deleteMessageEntity(MessageHiveEntity data);

  Future deleteMessageEntityByUniqueId(String uniqueId);

  /// get message entity with message ID
  MessageHiveEntity? getMessageEntity(String messageId);

  /// Listen message with message id
  Stream<MessageHiveEntity> listenMessageEntity(String messageId);

  /// Listen Message Entities
  Stream<List<MessageHiveEntity>> listenMessageEntities(
      RequestBuilder<MessageQueryRequest> request);

  /// get message entities caches
  List<MessageHiveEntity> getMessageEntities(
      RequestBuilder<MessageQueryRequest> request);

  /// delete all message with in the channel
  Future deleteMessagesByChannelId(String channelId);

  /// Get all the messages which have SYNCING status.
  List<MessageHiveEntity> getUnsendMessages();

  /// get the highest channel sagment for the channel Id
  int getHighestChannelSagment(String channelId);

  /// Soft delete message from channel by user Id to handle channel banned event
  void softDeleteFromChannelByUserId(String channelId, String userId);

  /// To clean up the unsynced messages when the user logged in to use sdk
  Future updateUnsyncedMessagesToFailed();
}
