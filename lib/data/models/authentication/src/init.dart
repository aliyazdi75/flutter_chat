import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'init.g.dart';

abstract class AuthInitRequest
    implements Built<AuthInitRequest, AuthInitRequestBuilder> {
  String get email;

  AuthInitRequest._();

  factory AuthInitRequest([void Function(AuthInitRequestBuilder) updates]) =
      _$AuthInitRequest;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthInitRequest.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<AuthInitRequest> get serializer =>
      _$authInitRequestSerializer;
}

abstract class AuthInitResponse
    implements Built<AuthInitResponse, AuthInitResponseBuilder> {
  bool get exists;

  AuthInitResponse._();

  factory AuthInitResponse([void Function(AuthInitResponseBuilder) updates]) =
      _$AuthInitResponse;

  static AuthInitResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthInitResponse.serializer, json)!;
  }

  static Serializer<AuthInitResponse> get serializer =>
      _$authInitResponseSerializer;
}
