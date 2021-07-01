import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'exception.dart';
import 'serializers.dart';

part 'badrequests.g.dart';

abstract class AuthInitBadRequest
    implements Built<AuthInitBadRequest, AuthInitBadRequestBuilder> {
  BuiltList<ValidationFieldError>? get email;

  AuthInitBadRequest._();

  factory AuthInitBadRequest(
          [void Function(AuthInitBadRequestBuilder) updates]) =
      _$AuthInitBadRequest;

  static AuthInitBadRequest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthInitBadRequest.serializer, json)!;
  }

  static Serializer<AuthInitBadRequest> get serializer =>
      _$authInitBadRequestSerializer;
}

class LoginBadRequestCode extends EnumClass {
  @BuiltValueEnumConst(wireName: 'LOCKED_OUT')
  static const LoginBadRequestCode lockedOut = _$lockedOut;

  @BuiltValueEnumConst(wireName: 'NOT_ACTIVATED')
  static const LoginBadRequestCode notActivated = _$notActivated;

  @BuiltValueEnumConst(wireName: 'INVALID_CREDENTIALS')
  static const LoginBadRequestCode invalidCredentials = _$invalidCredentials;

  const LoginBadRequestCode._(String name) : super(name);

  static BuiltSet<LoginBadRequestCode> get values =>
      _$loginBadRequestCodeValues;

  static LoginBadRequestCode valueOf(String name) =>
      _$loginBadRequestCodeValueOf(name);

  static Serializer<LoginBadRequestCode> get serializer =>
      _$loginBadRequestCodeSerializer;
}

class RegisterBadRequestCode extends EnumClass {
  @BuiltValueEnumConst(wireName: 'DuplicateUserName')
  static const RegisterBadRequestCode duplicateUserName = _$duplicateUserName;

  @BuiltValueEnumConst(wireName: 'PasswordRequiresNonAlphanumeric')
  static const RegisterBadRequestCode passwordRequiresNonAlphanumeric =
      _$passwordRequiresNonAlphanumeric;

  @BuiltValueEnumConst(wireName: 'PasswordRequiresLower')
  static const RegisterBadRequestCode passwordRequiresLower =
      _$passwordRequiresLower;

  @BuiltValueEnumConst(wireName: 'PasswordRequiresUpper')
  static const RegisterBadRequestCode passwordRequiresUpper =
      _$passwordRequiresUpper;

  const RegisterBadRequestCode._(String name) : super(name);

  static BuiltSet<RegisterBadRequestCode> get values =>
      _$registerBadRequestCodeValues;

  static RegisterBadRequestCode valueOf(String name) =>
      _$registerBadRequestCodeValueOf(name);

  static Serializer<RegisterBadRequestCode> get serializer =>
      _$registerBadRequestCodeSerializer;
}
