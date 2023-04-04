import 'dart:convert';
import 'dart:io';

import 'package:amity_sdk/src/src.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

import '../helper/amity_core_client_mock_setup.dart';

class MockPublicPostApiInterface extends Mock
    implements PublicPostApiInterface {}

class MockReactionApiInterface extends Mock implements ReactionApiInterface {}

// integration_test_id:ddc6da15-cfa3-4f54-ad52-be50c2841d6e
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  String referenceId = const Uuid().v1();
  String referenceType = 'post';
  String reactionName = 'like';

  final mockPublicPostApiInterface = MockPublicPostApiInterface();
  final reactionApiInterface = MockReactionApiInterface();

  setUpAll(() async {
    registerFallbackValue(ReactionRequest(
        referenceId: referenceId,
        referenceType: referenceType,
        reactionName: reactionName));

    registerFallbackValue(UsersRequest());

    await AmityCoreClientMockSetup.setup();
    await AmityCoreClientMockSetup.loadMockSession();

    serviceLocator.registerLazySingleton<PublicPostApiInterface>(
      () => mockPublicPostApiInterface,
    );

    serviceLocator.registerLazySingleton<ReactionApiInterface>(
      () => reactionApiInterface,
    );
  });

  test(
      'When user try to add reaction to non existing content, it should respond resource not found error (400400).',
      () async {
    /// Mock the get post
    when(() => mockPublicPostApiInterface.getPostById(referenceId))
        .thenAnswer((_) async {
      final response =
          await File('test/mock_json/amity_post_text.json').readAsString();
      return CreatePostResponse.fromJson(json.decode(response));
    });

    /// Mock add reaction to the post
    when(() => reactionApiInterface.addReaction(any<ReactionRequest>()))
        .thenAnswer((_) async {
      final response = await File('test/mock_json/amity_reaction_add_fail.json')
          .readAsString();
      final amityError = AmityErrorResponse.fromJson(json.decode(response));
      throw amityError.amityException();
    });

    try {
      final amityPost =
          await AmitySocialClient.newPostRepository().getPost(referenceId);
      await amityPost.react().addReaction(reactionName);
    } catch (error) {
      expect(error, isA<AmityException>());
    }
  });

  tearDownAll(() async {
    await AmityCoreClient.logout();
  });
}