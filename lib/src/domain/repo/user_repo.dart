import 'package:amity_sdk/amity_sdk.dart';
import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/data/data.dart';

abstract class UserRepo {
  Future<AmityUser> getUserById(String userId);
  Future<AmityUser> getUserByIdFromDb(String userId);
  Future<PageListData<List<AmityUser>, String>> getUsers(UsersRequest request);
  Future<PageListData<List<AmityUser>, String>> queryUsers(UsersRequest request);
  Stream<List<AmityUser>> listenUserChanges(RequestBuilder<UsersRequest> request);
  List<UserHiveEntity> getUserEntities(RequestBuilder<UsersRequest> request);
  List<String> getPermissions(String userId);
  Future<List<AmityUser>> updateUser(UpdateUserRequest request);
  Future<AmityUser> flag(String userId);
  Future<AmityUser> unflag(String userId);
  Future block(String userId);
  Future unblock(String userId);
  Future<PageListData<List<AmityUser>, String>> getBlockedUsers(OptionsRequest request);
  List<AmityUser> getUsersFromDB();
}
