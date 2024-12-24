import 'package:amity_sdk/src/core/core.dart';
import 'package:amity_sdk/src/domain/domain.dart';

class UserFetchListUseCase extends UseCase<
    PageListData<List<AmityUser>, String>, UsersRequest> {

  final UserRepo userRepo;

  UserFetchListUseCase({required this.userRepo});
  
  @override
  Future<PageListData<List<AmityUser>, String>> get(
      UsersRequest params) async {
    return await userRepo.queryUsers(params);
  }
}
