import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/services/shared_preferences/index.dart';

const key = 'token';

class AuthenticationStorage {
  static Future<Authentication> getCredit() async {
    final response = await SharedPreferencesHelper.getObject(key: key);
    if (response != null) {
      return Authentication.fromJson(response);
    } else {
      throw NoTokenException();
    }
  }

  static Future<void> saveCredit(Authentication authentication) async {
    final value = authentication.toJson();
    await SharedPreferencesHelper.saveObject(key: key, value: value);
  }

  static Future<void> removeCredit() async {
    await SharedPreferencesHelper.removeObject(key: key);
  }
}
