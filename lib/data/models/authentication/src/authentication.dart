import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'authentication.g.dart';

abstract class Authentication
    implements Built<Authentication, AuthenticationBuilder> {
  @nullable
  String get token;

  Authentication._();

  factory Authentication([void Function(AuthenticationBuilder) updates]) =
      _$Authentication;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Authentication.serializer, this)
        as Map<String, dynamic>;
  }

  static Authentication fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Authentication.serializer, json);
  }

  static Serializer<Authentication> get serializer =>
      _$authenticationSerializer;
}
