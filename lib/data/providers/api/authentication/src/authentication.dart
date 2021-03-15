import 'package:flutter_chat/data/models/authentication/index.dart';
import 'package:flutter_chat/services/http/index.dart';

class AuthenticationApi {
  static Future<RegisterResponse> register(
      RegisterRequest registerRequest) async {
    final body = registerRequest.toJson();
    final response = await HttpHelper('auth/signup').httpPost(body: body);
    return RegisterResponse.fromJson(response);
  }

  static Future<AuthInitResponse> init(AuthInitRequest authInitRequest) async {
    final body = authInitRequest.toJson();
    final response = await HttpHelper('auth/init').httpPost(body: body);
    return AuthInitResponse.fromJson(response);
  }

  static Future<Authentication> login(LoginRequest loginRequest) async {
    final body = loginRequest.toJson();
    final response = await HttpHelper('auth/signin').httpPost(body: body);
    return Authentication.fromJson(response);
  }

  static Future<void> logout() async {
    await HttpHelper('auth/signout')
        .httpGet(headerType: HttpHeaderType.authenticated);
  }
}
