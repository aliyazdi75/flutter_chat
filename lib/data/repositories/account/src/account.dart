import 'package:flutter_chat/data/models/account/index.dart';
import 'package:flutter_chat/data/providers/api/account/index.dart';

class AccountRepository {
  Account? _account;

  Account? get account => _account;

  Future<Account> getMyAccount() async {
    if (_account == null) {
      final myUserAccount = await AccountApi.getMyAccount();
      _account = myUserAccount;
    }
    return _account!;
  }
}
