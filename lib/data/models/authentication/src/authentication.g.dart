// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Authentication> _$authenticationSerializer =
    new _$AuthenticationSerializer();

class _$AuthenticationSerializer
    implements StructuredSerializer<Authentication> {
  @override
  final Iterable<Type> types = const [Authentication, _$Authentication];
  @override
  final String wireName = 'Authentication';

  @override
  Iterable<Object> serialize(Serializers serializers, Authentication object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Authentication deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Authentication extends Authentication {
  @override
  final String token;

  factory _$Authentication([void Function(AuthenticationBuilder) updates]) =>
      (new AuthenticationBuilder()..update(updates)).build();

  _$Authentication._({this.token}) : super._();

  @override
  Authentication rebuild(void Function(AuthenticationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationBuilder toBuilder() =>
      new AuthenticationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Authentication && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Authentication')..add('token', token))
        .toString();
  }
}

class AuthenticationBuilder
    implements Builder<Authentication, AuthenticationBuilder> {
  _$Authentication _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  AuthenticationBuilder();

  AuthenticationBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Authentication other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Authentication;
  }

  @override
  void update(void Function(AuthenticationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Authentication build() {
    final _$result = _$v ?? new _$Authentication._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
