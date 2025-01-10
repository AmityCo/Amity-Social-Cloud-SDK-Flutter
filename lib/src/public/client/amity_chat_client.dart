import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/service_locator/service_locator.dart';

/// [AmityChatClient]
class AmityChatClient {
  /// [MessageRepository]
  static MessageRepository newMessageRepository() {
    return serviceLocator<MessageRepository>();
  }

  /// [AmityChannelRepository]
  static AmityChannelRepository newChannelRepository() {
    return serviceLocator<AmityChannelRepository>();
  }

  static AmitySubChannelRepository newSubChannelRepository() => serviceLocator<AmitySubChannelRepository>();
}
