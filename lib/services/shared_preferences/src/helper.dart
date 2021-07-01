import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<Map<String, dynamic>?> getObject({
    required String key,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final object = prefs.getString(key);
    return object == null ? null : json.decode(object) as Map<String, dynamic>?;
  }

  static Future<void> saveObject({
    required String key,
    required Map<String, dynamic>? value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }

  static Future<void> removeObject({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
