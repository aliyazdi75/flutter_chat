import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  String? get firstName;

  String? get lastName;

  String? get fullName;

  int? get cityId;

  Gender? get gender;

  DateTime? get birthDate;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;

  static User fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(User.serializer, json)!;
  }

  static Serializer<User> get serializer => _$userSerializer;
}

class Gender extends EnumClass {
  @BuiltValueEnumConst(wireName: 'Male')
  static const Gender male = _$male;

  @BuiltValueEnumConst(wireName: 'Female')
  static const Gender female = _$female;

  const Gender._(String name) : super(name);

  static BuiltSet<Gender> get values => _$genderValues;

  static Gender valueOf(String name) => _$genderValueOf(name);

  static Gender deserialize(String string) {
    return serializers.deserializeWith(Gender.serializer, string)!;
  }

  static Serializer<Gender> get serializer => _$genderSerializer;
}
