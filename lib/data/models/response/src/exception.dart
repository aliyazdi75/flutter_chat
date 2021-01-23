import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'exception.g.dart';

abstract class HttpExceptionModel
    implements Built<HttpExceptionModel, HttpExceptionModelBuilder> {
  String get key;

  String get value;

  HttpExceptionModel._();

  factory HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder) updates]) =
      _$HttpExceptionModel;

  static HttpExceptionModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(HttpExceptionModel.serializer, json);
  }

  static Serializer<HttpExceptionModel> get serializer =>
      _$httpExceptionModelSerializer;
}

abstract class RegisterBadRequest
    implements Built<RegisterBadRequest, RegisterBadRequestBuilder> {
  @nullable
  BuiltList<String> get username;

  @nullable
  BuiltList<String> get password;

  @nullable
  BuiltList<String> get email;

  @nullable
  @BuiltValueField(wireName: 'non_field_errors')
  BuiltList<String> get nonFieldErrors;

  RegisterBadRequest._();

  factory RegisterBadRequest(
          [void Function(RegisterBadRequestBuilder) updates]) =
      _$RegisterBadRequest;

  static RegisterBadRequest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(RegisterBadRequest.serializer, json);
  }

  static Serializer<RegisterBadRequest> get serializer =>
      _$registerBadRequestSerializer;
}

abstract class LoginBadRequest
    implements Built<LoginBadRequest, LoginBadRequestBuilder> {
  @nullable
  BuiltList<String> get username;

  @nullable
  BuiltList<String> get password;

  @nullable
  @BuiltValueField(wireName: 'non_field_errors')
  BuiltList<String> get nonFieldErrors;

  LoginBadRequest._();

  factory LoginBadRequest([void Function(LoginBadRequestBuilder) updates]) =
      _$LoginBadRequest;

  static LoginBadRequest fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginBadRequest.serializer, json);
  }

  static Serializer<LoginBadRequest> get serializer =>
      _$loginBadRequestSerializer;
}
