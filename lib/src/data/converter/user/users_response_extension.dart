import 'package:amity_sdk/src/data/data.dart';

/// [UserResponse] extension method to save [UserResponse] to database
extension UsersResponseExtension on UsersResponse {

  Future saveToDb<T>(
    UserDbAdapter userDbAdapter,
    FileDbAdapter fileDbAdapter,
  ) async {
    final userHiveEntities = users.map((e) => e.convertToUserHiveEntity()).toList();
    final fileHiveEntities = files.map((e) => e.convertToFileHiveEntity()).toList();
    await userDbAdapter.saveUserEntities(userHiveEntities);
    await fileDbAdapter.saveFileEntities(fileHiveEntities);
  }
  
}
