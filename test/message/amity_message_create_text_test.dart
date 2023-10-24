import 'dart:convert';
import 'dart:io';

import 'package:amity_sdk/src/src.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helper/amity_core_client_mock_setup.dart';

class MockMessageApiInterface extends Mock implements MessageApiInterface {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  String channelId = '64b508e658d70b51ee98c002';
  String message = 'message';

  final mockMessageApiInterface = MockMessageApiInterface();

  setUpAll(() async {
    registerFallbackValue(CreateMessageRequest(channelId: channelId));

    await AmityCoreClientMockSetup.setup();

    await AmityCoreClientMockSetup.loadMockSession();

    serviceLocator.registerLazySingleton<MessageApiInterface>(
      () => mockMessageApiInterface,
    );
  });

  test(
      'When the user updates a message it should get a updated message back in response',
      () async {
    when(() =>
            mockMessageApiInterface.createMessage(any<CreateMessageRequest>()))
        .thenAnswer((_) async {
      final response =
          await File('test/mock_json/amity_message_text_update.json')
              .readAsString();
      return CreateMessageResponse.fromJson(json.decode(response));
    });

    final amityMessage = await AmityChatClient.newMessageRepository()
        .createMessage(channelId)
        .text(message)
        .send();

    print("${amityMessage}");

    expect(amityMessage, isA<AmityMessage>());
  });

  tearDownAll(() async {
    await AmityCoreClient.logout();
  });
}
