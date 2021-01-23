import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'login.g.dart';

abstract class Login implements Built<Login, LoginBuilder> {
  @nullable
  String get token;

  Login._();

  factory Login([void Function(LoginBuilder) updates]) = _$Login;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Login.serializer, this)
        as Map<String, dynamic>;
  }

  static Login fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Login.serializer, json);
  }

  static Serializer<Login> get serializer => _$loginSerializer;
}

abstract class LoginBody implements Built<LoginBody, LoginBodyBuilder> {
  String get username;

  String get password;

  LoginBody._();

  factory LoginBody([void Function(LoginBodyBuilder) updates]) = _$LoginBody;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginBody.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<LoginBody> get serializer => _$loginBodySerializer;
}
