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
  Iterable<Object?> serialize(Serializers serializers, Authentication object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
    ];

    return result;
  }

  @override
  Authentication deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Authentication extends Authentication {
  @override
  final String token;
  @override
  final User user;

  factory _$Authentication([void Function(AuthenticationBuilder)? updates]) =>
      (new AuthenticationBuilder()..update(updates)).build();

  _$Authentication._({required this.token, required this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(token, 'Authentication', 'token');
    BuiltValueNullFieldError.checkNotNull(user, 'Authentication', 'user');
  }

  @override
  Authentication rebuild(void Function(AuthenticationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationBuilder toBuilder() =>
      new AuthenticationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Authentication &&
        token == other.token &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, token.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Authentication')
          ..add('token', token)
          ..add('user', user))
        .toString();
  }
}

class AuthenticationBuilder
    implements Builder<Authentication, AuthenticationBuilder> {
  _$Authentication? _$v;

  String? _token;

  String? get token => _$this._token;

  set token(String? token) => _$this._token = token;

  UserBuilder? _user;

  UserBuilder get user => _$this._user ??= new UserBuilder();

  set user(UserBuilder? user) => _$this._user = user;

  AuthenticationBuilder();

  AuthenticationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Authentication other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Authentication;
  }

  @override
  void update(void Function(AuthenticationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Authentication build() {
    _$Authentication _$result;
    try {
      _$result = _$v ??
          new _$Authentication._(
              token: BuiltValueNullFieldError.checkNotNull(
                  token, 'Authentication', 'token'),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Authentication', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
