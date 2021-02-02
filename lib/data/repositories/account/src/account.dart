import 'package:flutter_chat/data/models/account/index.dart';
import 'package:flutter_chat/data/providers/api/account/index.dart';

class AccountRepository {
  Account _account;

  Future<Account> getMyUserAccount() async {
    if (_account == null) {
      final myUserAccount = await AccountApi.getMyUserAccount();
      _account = myUserAccount;
    }
    return _account;
  }
}
