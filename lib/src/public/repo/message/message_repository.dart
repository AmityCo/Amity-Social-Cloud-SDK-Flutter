import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

/// [MessageRepository]
class MessageRepository {
  /*  begin_public_function
  id: message.query
  */
  /// Query messages with the given channelId.
  ///
  /// **Deprecated**: Use [newGetMessages] instead to query messages.
  ///
  /// This function is maintained for backward compatibility but is no longer
  /// recommended for use in new implementations.
  ///
  /// Note: This function only supports system generated channelId.
  /// In case of custom channelId, replace with AmityChannel.defaultSubChannelId
  ///
  /// Example:
  /// ```dart
  /// var defaultSubChannelId = channel.defaultSubChannelId;
  /// getMessages(defaultSubChannelId);
  /// ```
  @Deprecated("Now only support system generated channelId. In case of custom channelId, replace with channel.defaultSubChannelId")
  MessageGetQueryBuilder getMessages(String channelId) {
    return MessageGetQueryBuilder(serviceLocator<MessageQueryUseCase>(), channelId);
  }
  /* end_public_function */



  MessageGetQueryBuilder newGetMessages(String subchannelId) {
    return MessageGetQueryBuilder(serviceLocator<MessageQueryUseCase>(), subchannelId);
  }


  AmityMessageCreateDataTypeSelector newCreateMessage(String subchannelId) {
    return AmityMessageCreateTargetSelector(useCase: serviceLocator<MessageCreateUsecase>()).channelId(subchannelId);
  }

  /*  begin_public_function
  id: message.get
  */
  /// Get Messages
  Future<AmityMessage> getMessage(String messageId) {
    return serviceLocator<MessageGetUseCase>().get(messageId);
  }
  /* end_public_function */

  /*  begin_public_function
  id: message.create.text_message, message.create.image_message, message.create.file_message
  api_style: async
  */
  /// Create Message
  AmityMessageCreateDataTypeSelector createMessage(String channelId) {
    return AmityMessageCreateTargetSelector(useCase: serviceLocator<MessageCreateUsecase>()).channelId(channelId);
  }
  /* end_public_function */

  /*  begin_public_function
  id: message.edit
  api_style: async
  */
  /// Create Message
  AmityMessageUpdateQueryBuilder updateMessage(String channelId, String messageId) {
    return AmityMessageUpdateQueryBuilder(
        useCase: serviceLocator<MessageUpdateUsecase>(), channelId: channelId, messageId: messageId);
  }
  /* end_public_function */

  /*  begin_public_function
  id: message.soft_delete
  */
  /// Delete message
  Future deleteMessage(String messageId) {
    return serviceLocator<MessageDeleteUsecase>().get(messageId);
  }
  /* end_public_function */

  /// Get [AmityReaction] for the message Id
  GetReactionQueryBuilder getReaction({required String messageId}) {
    return GetReactionQueryBuilder.message(messageId: messageId);
  }

  /*  begin_public_function
  id: message.flag
  */
  /// flag message
  Future<AmityMessage> flag(String messageId) {
    return MessageFlagQueryBuilder(
            messageFlagUsecase: serviceLocator(), messageUnflagUsecase: serviceLocator(), messageId: messageId)
        .flag();
  }
  /* end_public_function */

  /*  begin_public_function
  id: message.unflag
  */
  /// unflag message
  Future<AmityMessage> unflag(String messageId) {
    return MessageFlagQueryBuilder(
            messageFlagUsecase: serviceLocator(), messageUnflagUsecase: serviceLocator(), messageId: messageId)
        .unflag();
  }
  /* end_public_function */
}
