import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesBase {
  Future<Map<String, dynamic>> getObject({
    @required String key,
  });

  Future<void> saveObject({
    @required String key,
    @required Map<String, dynamic> value,
  });
}

class SharedPreferencesHelper implements SharedPreferencesBase {
  @override
  Future<Map<String, dynamic>> getObject({
    @required String key,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final object = prefs.getString(key);
    return object == null ? null : json.decode(object) as Map<String, dynamic>;
  }

  @override
  Future<void> saveObject({
    @required String key,
    @required Map<String, dynamic> value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }
}
