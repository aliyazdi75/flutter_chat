import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'register.g.dart';

abstract class RegisterRequest
    implements Built<RegisterRequest, RegisterRequestBuilder> {
  String get email;

  String get password;

  RegisterRequest._();

  factory RegisterRequest([void Function(RegisterRequestBuilder) updates]) =
      _$RegisterRequest;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(RegisterRequest.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<RegisterRequest> get serializer =>
      _$registerRequestSerializer;
}

abstract class RegisterResponse
    implements Built<RegisterResponse, RegisterResponseBuilder> {
  bool get success;

  RegisterResponse._();

  factory RegisterResponse([void Function(RegisterResponseBuilder) updates]) =
      _$RegisterResponse;

  static RegisterResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(RegisterResponse.serializer, json)!;
  }

  static Serializer<RegisterResponse> get serializer =>
      _$registerResponseSerializer;
}
