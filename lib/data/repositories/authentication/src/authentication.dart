import 'dart:async';

import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/data/providers/api/authentication/index.dart';
import 'package:flutter_chat/data/providers/storage/authentication/index.dart';
import 'package:flutter_chat/services/device_info/index.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  Future<RegisterResponse> register({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    final registerRequest = RegisterRequest(
      (b) => b
        ..email = email
        ..password = password,
    );

    return await AuthenticationApi.register(registerRequest);
  }

  Future<void> login({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    final deviceInfoHelper = DeviceInfoHelper();
    final deviceId = await deviceInfoHelper.getPlatformId();
    final deviceName = await deviceInfoHelper.getPlatformName();
    final deviceFriendlyName = await deviceInfoHelper.getPlatformFriendlyName();
    final deviceVersion = await deviceInfoHelper.getPlatformVersion();
    final deviceOS = deviceInfoHelper.getPlatformOS();
    final loginRequest = LoginRequest(
      (b) async => b
        ..email = email == '1'
            ? testEmail1
            : email == '2'
                ? testEmail2
                : email
        ..password = password == '1'
            ? testPassword1
            : password == '2'
                ? testPassword2
                : password
        ..deviceId = deviceId
        ..deviceName = deviceName
        ..deviceFriendlyName = deviceFriendlyName
        ..deviceVersion = deviceVersion
        ..deviceOS = deviceOS,
    );

    final authenticated = await AuthenticationApi.login(loginRequest);
    await AuthenticationStorage.saveCredit(authenticated);
    return authenticated;
  }

  Future<AuthInitResponse> init({@required String email}) async {
    assert(email != null);

    final authInitRequest = AuthInitRequest(
      (b) => b
        ..email = email == '1'
            ? testEmail1
            : email == '2'
                ? testEmail2
                : email,
    );

    return await AuthenticationApi.init(authInitRequest);
  }

  Future<Authentication> getCredit() async {
    return await AuthenticationStorage.getCredit();
  }

  static Future<void> logout() async {
    await AuthenticationApi.logout();
    await AuthenticationStorage.removeCredit();
  }
}
