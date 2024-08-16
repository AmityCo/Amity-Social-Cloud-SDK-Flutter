import 'package:amity_sdk/src/data/data.dart';
import 'package:amity_sdk/src/domain/repo/account_repo.dart';

class AccountRepoImpl extends AccountRepo {
  final AccountDbAdapter accountDbAdapter;
  AccountRepoImpl({required this.accountDbAdapter});

  @override
  AccountHiveEntity? getAccount(String userId) {
    return accountDbAdapter.getAccountEntity(userId);
  }

  @override
  Stream<AccountHiveEntity?> listenAccount(String userId) {
    return accountDbAdapter.listenAccountEntity(userId);
  }

  @override
  Stream<AccountHiveEntity?> listenAuthState() {
    return accountDbAdapter.listenAccounts();
  }

  @override
  List<AccountHiveEntity> getAccounts() {
    return accountDbAdapter.getAccounts();
  }
}
