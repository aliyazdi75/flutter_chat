import 'dart:async';

import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/data/providers/api/authentication/index.dart';
import 'package:flutter_chat/data/providers/storage/authentication/index.dart';
import 'package:flutter_chat/services/device_info/index.dart';

class AuthenticationRepository {
  Authentication? _credit;

  Future<RegisterResponse> register({
    required String email,
    required String password,
  }) async {
    final registerRequest = RegisterRequest(
      (b) => b
        ..email = email
        ..password = password,
    );

    return await AuthenticationApi.register(registerRequest);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
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
  }

  Future<AuthInitResponse> init({required String email}) async {
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
    _credit ??= await AuthenticationStorage.getCredit();
    return _credit!;
  }

  Future<void> logout() async {
    _credit = null;
    await AuthenticationApi.logout();
    await AuthenticationStorage.removeCredit();
  }
}
