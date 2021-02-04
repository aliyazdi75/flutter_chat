import 'package:flutter_chat/data/models/account/index.dart';
import 'package:flutter_chat/services/http/index.dart';

class AccountApi {
  static Future<Account> getMyAccount() async {
    final response = await HttpHelper('user/info').httpGet(
      headerType: HttpHeaderType.authenticated,
    );
    return Account.fromJson(response);
  }
}
