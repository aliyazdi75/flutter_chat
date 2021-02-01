import 'dart:async';

import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/data/providers/api/authentication/index.dart';
import 'package:flutter_chat/data/providers/storage/authentication/index.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  Future<Register> register() async {
    throw UnimplementedError('Log out has not been implemented!');
  }

  Future<void> login({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    final loginBody = LoginBody(
      (b) => b
        ..username = username
        ..password = password,
    );

    final authenticated = await AuthenticationApi.login(loginBody);
    await AuthenticationStorage.saveCredit(authenticated);
    return authenticated;
  }

  Future<Authentication> getCredit() async {
    return await AuthenticationStorage.getCredit();
  }

  Future logout() async {
    throw UnimplementedError('Log out has not been implemented!');
  }
}
