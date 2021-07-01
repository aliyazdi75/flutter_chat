// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthInitRequest> _$authInitRequestSerializer =
    new _$AuthInitRequestSerializer();
Serializer<AuthInitResponse> _$authInitResponseSerializer =
    new _$AuthInitResponseSerializer();

class _$AuthInitRequestSerializer
    implements StructuredSerializer<AuthInitRequest> {
  @override
  final Iterable<Type> types = const [AuthInitRequest, _$AuthInitRequest];
  @override
  final String wireName = 'AuthInitRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthInitRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthInitRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthInitRequestBuilder();

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
      }
    }

    return result.build();
  }
}

class _$AuthInitResponseSerializer
    implements StructuredSerializer<AuthInitResponse> {
  @override
  final Iterable<Type> types = const [AuthInitResponse, _$AuthInitResponse];
  @override
  final String wireName = 'AuthInitResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, AuthInitResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'exists',
      serializers.serialize(object.exists, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AuthInitResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthInitResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'exists':
          result.exists = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthInitRequest extends AuthInitRequest {
  @override
  final String email;

  factory _$AuthInitRequest([void Function(AuthInitRequestBuilder)? updates]) =>
      (new AuthInitRequestBuilder()..update(updates)).build();

  _$AuthInitRequest._({required this.email}) : super._() {
    BuiltValueNullFieldError.checkNotNull(email, 'AuthInitRequest', 'email');
  }

  @override
  AuthInitRequest rebuild(void Function(AuthInitRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthInitRequestBuilder toBuilder() =>
      new AuthInitRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthInitRequest && email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(0, email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthInitRequest')..add('email', email))
        .toString();
  }
}

class AuthInitRequestBuilder
    implements Builder<AuthInitRequest, AuthInitRequestBuilder> {
  _$AuthInitRequest? _$v;

  String? _email;

  String? get email => _$this._email;

  set email(String? email) => _$this._email = email;

  AuthInitRequestBuilder();

  AuthInitRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthInitRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthInitRequest;
  }

  @override
  void update(void Function(AuthInitRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthInitRequest build() {
    final _$result = _$v ??
        new _$AuthInitRequest._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'AuthInitRequest', 'email'));
    replace(_$result);
    return _$result;
  }
}

class _$AuthInitResponse extends AuthInitResponse {
  @override
  final bool exists;

  factory _$AuthInitResponse(
          [void Function(AuthInitResponseBuilder)? updates]) =>
      (new AuthInitResponseBuilder()..update(updates)).build();

  _$AuthInitResponse._({required this.exists}) : super._() {
    BuiltValueNullFieldError.checkNotNull(exists, 'AuthInitResponse', 'exists');
  }

  @override
  AuthInitResponse rebuild(void Function(AuthInitResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthInitResponseBuilder toBuilder() =>
      new AuthInitResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthInitResponse && exists == other.exists;
  }

  @override
  int get hashCode {
    return $jf($jc(0, exists.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthInitResponse')
          ..add('exists', exists))
        .toString();
  }
}

class AuthInitResponseBuilder
    implements Builder<AuthInitResponse, AuthInitResponseBuilder> {
  _$AuthInitResponse? _$v;

  bool? _exists;

  bool? get exists => _$this._exists;

  set exists(bool? exists) => _$this._exists = exists;

  AuthInitResponseBuilder();

  AuthInitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exists = $v.exists;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthInitResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthInitResponse;
  }

  @override
  void update(void Function(AuthInitResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthInitResponse build() {
    final _$result = _$v ??
        new _$AuthInitResponse._(
            exists: BuiltValueNullFieldError.checkNotNull(
                exists, 'AuthInitResponse', 'exists'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
