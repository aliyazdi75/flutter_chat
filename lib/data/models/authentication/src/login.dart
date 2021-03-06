import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'login.g.dart';

abstract class LoginRequest
    implements Built<LoginRequest, LoginRequestBuilder> {
  String get email;

  String get password;

  String get deviceId;

  String get deviceName;

  String get deviceFriendlyName;

  String get deviceVersion;

  String get deviceOS;

  LoginRequest._();

  factory LoginRequest([void Function(LoginRequestBuilder) updates]) =
      _$LoginRequest;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginRequest.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<LoginRequest> get serializer => _$loginRequestSerializer;
}
