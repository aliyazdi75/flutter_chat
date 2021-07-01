// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badrequests.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LoginBadRequestCode _$lockedOut =
    const LoginBadRequestCode._('lockedOut');
const LoginBadRequestCode _$notActivated =
    const LoginBadRequestCode._('notActivated');
const LoginBadRequestCode _$invalidCredentials =
    const LoginBadRequestCode._('invalidCredentials');

LoginBadRequestCode _$loginBadRequestCodeValueOf(String name) {
  switch (name) {
    case 'lockedOut':
      return _$lockedOut;
    case 'notActivated':
      return _$notActivated;
    case 'invalidCredentials':
      return _$invalidCredentials;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LoginBadRequestCode> _$loginBadRequestCodeValues =
    new BuiltSet<LoginBadRequestCode>(const <LoginBadRequestCode>[
  _$lockedOut,
  _$notActivated,
  _$invalidCredentials,
]);

const RegisterBadRequestCode _$duplicateUserName =
    const RegisterBadRequestCode._('duplicateUserName');
const RegisterBadRequestCode _$passwordRequiresNonAlphanumeric =
    const RegisterBadRequestCode._('passwordRequiresNonAlphanumeric');
const RegisterBadRequestCode _$passwordRequiresLower =
    const RegisterBadRequestCode._('passwordRequiresLower');
const RegisterBadRequestCode _$passwordRequiresUpper =
    const RegisterBadRequestCode._('passwordRequiresUpper');

RegisterBadRequestCode _$registerBadRequestCodeValueOf(String name) {
  switch (name) {
    case 'duplicateUserName':
      return _$duplicateUserName;
    case 'passwordRequiresNonAlphanumeric':
      return _$passwordRequiresNonAlphanumeric;
    case 'passwordRequiresLower':
      return _$passwordRequiresLower;
    case 'passwordRequiresUpper':
      return _$passwordRequiresUpper;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RegisterBadRequestCode> _$registerBadRequestCodeValues =
    new BuiltSet<RegisterBadRequestCode>(const <RegisterBadRequestCode>[
  _$duplicateUserName,
  _$passwordRequiresNonAlphanumeric,
  _$passwordRequiresLower,
  _$passwordRequiresUpper,
]);

Serializer<AuthInitBadRequest> _$authInitBadRequestSerializer =
    new _$AuthInitBadRequestSerializer();
Serializer<LoginBadRequestCode> _$loginBadRequestCodeSerializer =
    new _$LoginBadRequestCodeSerializer();
Serializer<RegisterBadRequestCode> _$registerBadRequestCodeSerializer =
    new _$RegisterBadRequestCodeSerializer();

class _$AuthInitBadRequestSerializer
    implements StructuredSerializer<AuthInitBadRequest> {
  @override
  final Iterable<Type> types = const [AuthInitBadRequest, _$AuthInitBadRequest];
  @override
  final String wireName = 'AuthInitBadRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AuthInitBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ValidationFieldError)])));
    }
    return result;
  }

  @override
  AuthInitBadRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthInitBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ValidationFieldError)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginBadRequestCodeSerializer
    implements PrimitiveSerializer<LoginBadRequestCode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'lockedOut': 'LOCKED_OUT',
    'notActivated': 'NOT_ACTIVATED',
    'invalidCredentials': 'INVALID_CREDENTIALS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'LOCKED_OUT': 'lockedOut',
    'NOT_ACTIVATED': 'notActivated',
    'INVALID_CREDENTIALS': 'invalidCredentials',
  };

  @override
  final Iterable<Type> types = const <Type>[LoginBadRequestCode];
  @override
  final String wireName = 'LoginBadRequestCode';

  @override
  Object serialize(Serializers serializers, LoginBadRequestCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LoginBadRequestCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LoginBadRequestCode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$RegisterBadRequestCodeSerializer
    implements PrimitiveSerializer<RegisterBadRequestCode> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'duplicateUserName': 'DuplicateUserName',
    'passwordRequiresNonAlphanumeric': 'PasswordRequiresNonAlphanumeric',
    'passwordRequiresLower': 'PasswordRequiresLower',
    'passwordRequiresUpper': 'PasswordRequiresUpper',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'DuplicateUserName': 'duplicateUserName',
    'PasswordRequiresNonAlphanumeric': 'passwordRequiresNonAlphanumeric',
    'PasswordRequiresLower': 'passwordRequiresLower',
    'PasswordRequiresUpper': 'passwordRequiresUpper',
  };

  @override
  final Iterable<Type> types = const <Type>[RegisterBadRequestCode];
  @override
  final String wireName = 'RegisterBadRequestCode';

  @override
  Object serialize(Serializers serializers, RegisterBadRequestCode object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RegisterBadRequestCode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RegisterBadRequestCode.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$AuthInitBadRequest extends AuthInitBadRequest {
  @override
  final BuiltList<ValidationFieldError>? email;

  factory _$AuthInitBadRequest(
          [void Function(AuthInitBadRequestBuilder)? updates]) =>
      (new AuthInitBadRequestBuilder()..update(updates)).build();

  _$AuthInitBadRequest._({this.email}) : super._();

  @override
  AuthInitBadRequest rebuild(
          void Function(AuthInitBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthInitBadRequestBuilder toBuilder() =>
      new AuthInitBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthInitBadRequest && email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(0, email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthInitBadRequest')
          ..add('email', email))
        .toString();
  }
}

class AuthInitBadRequestBuilder
    implements Builder<AuthInitBadRequest, AuthInitBadRequestBuilder> {
  _$AuthInitBadRequest? _$v;

  ListBuilder<ValidationFieldError>? _email;

  ListBuilder<ValidationFieldError> get email =>
      _$this._email ??= new ListBuilder<ValidationFieldError>();

  set email(ListBuilder<ValidationFieldError>? email) => _$this._email = email;

  AuthInitBadRequestBuilder();

  AuthInitBadRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthInitBadRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthInitBadRequest;
  }

  @override
  void update(void Function(AuthInitBadRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthInitBadRequest build() {
    _$AuthInitBadRequest _$result;
    try {
      _$result = _$v ?? new _$AuthInitBadRequest._(email: _email?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'email';
        _email?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthInitBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
