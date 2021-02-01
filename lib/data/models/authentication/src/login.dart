import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'login.g.dart';

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
