// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginBody> _$loginBodySerializer = new _$LoginBodySerializer();

class _$LoginBodySerializer implements StructuredSerializer<LoginBody> {
  @override
  final Iterable<Type> types = const [LoginBody, _$LoginBody];
  @override
  final String wireName = 'LoginBody';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginBody deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginBody extends LoginBody {
  @override
  final String username;
  @override
  final String password;

  factory _$LoginBody([void Function(LoginBodyBuilder) updates]) =>
      (new LoginBodyBuilder()..update(updates)).build();

  _$LoginBody._({this.username, this.password}) : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('LoginBody', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginBody', 'password');
    }
  }

  @override
  LoginBody rebuild(void Function(LoginBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBodyBuilder toBuilder() => new LoginBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginBody &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginBody')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginBodyBuilder implements Builder<LoginBody, LoginBodyBuilder> {
  _$LoginBody _$v;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  LoginBodyBuilder();

  LoginBodyBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginBody other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginBody;
  }

  @override
  void update(void Function(LoginBodyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginBody build() {
    final _$result =
        _$v ?? new _$LoginBody._(username: username, password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
