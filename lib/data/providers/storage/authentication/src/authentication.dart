import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/services/shared_preferences/index.dart';

const key = 'token';

class AuthenticationStorage {
  static Future<Login> getCredit() async {
    final response = await SharedPreferencesHelper().getObject(key: key);
    return response == null ? null : Login.fromJson(response);
  }

  static Future<void> saveCredit(Login login) async {
    final value = login.toJson();
    await SharedPreferencesHelper().saveObject(key: key, value: value);
  }
}
