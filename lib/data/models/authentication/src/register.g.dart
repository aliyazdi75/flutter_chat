// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterRequest> _$registerRequestSerializer =
    new _$RegisterRequestSerializer();
Serializer<RegisterResponse> _$registerResponseSerializer =
    new _$RegisterResponseSerializer();

class _$RegisterRequestSerializer
    implements StructuredSerializer<RegisterRequest> {
  @override
  final Iterable<Type> types = const [RegisterRequest, _$RegisterRequest];
  @override
  final String wireName = 'RegisterRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegisterRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  RegisterRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
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

class _$RegisterResponseSerializer
    implements StructuredSerializer<RegisterResponse> {
  @override
  final Iterable<Type> types = const [RegisterResponse, _$RegisterResponse];
  @override
  final String wireName = 'RegisterResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegisterResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  RegisterResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterRequest extends RegisterRequest {
  @override
  final String email;
  @override
  final String password;

  factory _$RegisterRequest([void Function(RegisterRequestBuilder)? updates]) =>
      (new RegisterRequestBuilder()..update(updates)).build();

  _$RegisterRequest._({required this.email, required this.password})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, 'RegisterRequest', 'email');
    BuiltValueNullFieldError.checkNotNull(
        password, 'RegisterRequest', 'password');
  }

  @override
  RegisterRequest rebuild(void Function(RegisterRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterRequestBuilder toBuilder() =>
      new RegisterRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterRequest &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterRequest')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class RegisterRequestBuilder
    implements Builder<RegisterRequest, RegisterRequestBuilder> {
  _$RegisterRequest? _$v;

  String? _email;

  String? get email => _$this._email;

  set email(String? email) => _$this._email = email;

  String? _password;

  String? get password => _$this._password;

  set password(String? password) => _$this._password = password;

  RegisterRequestBuilder();

  RegisterRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterRequest;
  }

  @override
  void update(void Function(RegisterRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterRequest build() {
    final _$result = _$v ??
        new _$RegisterRequest._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'RegisterRequest', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'RegisterRequest', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$RegisterResponse extends RegisterResponse {
  @override
  final bool success;

  factory _$RegisterResponse(
          [void Function(RegisterResponseBuilder)? updates]) =>
      (new RegisterResponseBuilder()..update(updates)).build();

  _$RegisterResponse._({required this.success}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        success, 'RegisterResponse', 'success');
  }

  @override
  RegisterResponse rebuild(void Function(RegisterResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterResponseBuilder toBuilder() =>
      new RegisterResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterResponse && success == other.success;
  }

  @override
  int get hashCode {
    return $jf($jc(0, success.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterResponse')
          ..add('success', success))
        .toString();
  }
}

class RegisterResponseBuilder
    implements Builder<RegisterResponse, RegisterResponseBuilder> {
  _$RegisterResponse? _$v;

  bool? _success;

  bool? get success => _$this._success;

  set success(bool? success) => _$this._success = success;

  RegisterResponseBuilder();

  RegisterResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterResponse;
  }

  @override
  void update(void Function(RegisterResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterResponse build() {
    final _$result = _$v ??
        new _$RegisterResponse._(
            success: BuiltValueNullFieldError.checkNotNull(
                success, 'RegisterResponse', 'success'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
