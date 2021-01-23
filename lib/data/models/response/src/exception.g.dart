// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HttpExceptionModel> _$httpExceptionModelSerializer =
    new _$HttpExceptionModelSerializer();
Serializer<RegisterBadRequest> _$registerBadRequestSerializer =
    new _$RegisterBadRequestSerializer();
Serializer<LoginBadRequest> _$loginBadRequestSerializer =
    new _$LoginBadRequestSerializer();

class _$HttpExceptionModelSerializer
    implements StructuredSerializer<HttpExceptionModel> {
  @override
  final Iterable<Type> types = const [HttpExceptionModel, _$HttpExceptionModel];
  @override
  final String wireName = 'HttpExceptionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, HttpExceptionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'key',
      serializers.serialize(object.key, specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HttpExceptionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HttpExceptionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterBadRequestSerializer
    implements StructuredSerializer<RegisterBadRequest> {
  @override
  final Iterable<Type> types = const [RegisterBadRequest, _$RegisterBadRequest];
  @override
  final String wireName = 'RegisterBadRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, RegisterBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.nonFieldErrors != null) {
      result
        ..add('non_field_errors')
        ..add(serializers.serialize(object.nonFieldErrors,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  RegisterBadRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'email':
          result.email.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_field_errors':
          result.nonFieldErrors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginBadRequestSerializer
    implements StructuredSerializer<LoginBadRequest> {
  @override
  final Iterable<Type> types = const [LoginBadRequest, _$LoginBadRequest];
  @override
  final String wireName = 'LoginBadRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginBadRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.nonFieldErrors != null) {
      result
        ..add('non_field_errors')
        ..add(serializers.serialize(object.nonFieldErrors,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  LoginBadRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBadRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'username':
          result.username.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'password':
          result.password.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'non_field_errors':
          result.nonFieldErrors.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$HttpExceptionModel extends HttpExceptionModel {
  @override
  final String key;
  @override
  final String value;

  factory _$HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder) updates]) =>
      (new HttpExceptionModelBuilder()..update(updates)).build();

  _$HttpExceptionModel._({this.key, this.value}) : super._() {
    if (key == null) {
      throw new BuiltValueNullFieldError('HttpExceptionModel', 'key');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('HttpExceptionModel', 'value');
    }
  }

  @override
  HttpExceptionModel rebuild(
          void Function(HttpExceptionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HttpExceptionModelBuilder toBuilder() =>
      new HttpExceptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HttpExceptionModel &&
        key == other.key &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, key.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HttpExceptionModel')
          ..add('key', key)
          ..add('value', value))
        .toString();
  }
}

class HttpExceptionModelBuilder
    implements Builder<HttpExceptionModel, HttpExceptionModelBuilder> {
  _$HttpExceptionModel _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  HttpExceptionModelBuilder();

  HttpExceptionModelBuilder get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpExceptionModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HttpExceptionModel;
  }

  @override
  void update(void Function(HttpExceptionModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HttpExceptionModel build() {
    final _$result = _$v ?? new _$HttpExceptionModel._(key: key, value: value);
    replace(_$result);
    return _$result;
  }
}

class _$RegisterBadRequest extends RegisterBadRequest {
  @override
  final BuiltList<String> username;
  @override
  final BuiltList<String> password;
  @override
  final BuiltList<String> email;
  @override
  final BuiltList<String> nonFieldErrors;

  factory _$RegisterBadRequest(
          [void Function(RegisterBadRequestBuilder) updates]) =>
      (new RegisterBadRequestBuilder()..update(updates)).build();

  _$RegisterBadRequest._(
      {this.username, this.password, this.email, this.nonFieldErrors})
      : super._();

  @override
  RegisterBadRequest rebuild(
          void Function(RegisterBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBadRequestBuilder toBuilder() =>
      new RegisterBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterBadRequest &&
        username == other.username &&
        password == other.password &&
        email == other.email &&
        nonFieldErrors == other.nonFieldErrors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, username.hashCode), password.hashCode), email.hashCode),
        nonFieldErrors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RegisterBadRequest')
          ..add('username', username)
          ..add('password', password)
          ..add('email', email)
          ..add('nonFieldErrors', nonFieldErrors))
        .toString();
  }
}

class RegisterBadRequestBuilder
    implements Builder<RegisterBadRequest, RegisterBadRequestBuilder> {
  _$RegisterBadRequest _$v;

  ListBuilder<String> _username;
  ListBuilder<String> get username =>
      _$this._username ??= new ListBuilder<String>();
  set username(ListBuilder<String> username) => _$this._username = username;

  ListBuilder<String> _password;
  ListBuilder<String> get password =>
      _$this._password ??= new ListBuilder<String>();
  set password(ListBuilder<String> password) => _$this._password = password;

  ListBuilder<String> _email;
  ListBuilder<String> get email => _$this._email ??= new ListBuilder<String>();
  set email(ListBuilder<String> email) => _$this._email = email;

  ListBuilder<String> _nonFieldErrors;
  ListBuilder<String> get nonFieldErrors =>
      _$this._nonFieldErrors ??= new ListBuilder<String>();
  set nonFieldErrors(ListBuilder<String> nonFieldErrors) =>
      _$this._nonFieldErrors = nonFieldErrors;

  RegisterBadRequestBuilder();

  RegisterBadRequestBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username?.toBuilder();
      _password = _$v.password?.toBuilder();
      _email = _$v.email?.toBuilder();
      _nonFieldErrors = _$v.nonFieldErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterBadRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RegisterBadRequest;
  }

  @override
  void update(void Function(RegisterBadRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RegisterBadRequest build() {
    _$RegisterBadRequest _$result;
    try {
      _$result = _$v ??
          new _$RegisterBadRequest._(
              username: _username?.build(),
              password: _password?.build(),
              email: _email?.build(),
              nonFieldErrors: _nonFieldErrors?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'username';
        _username?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'email';
        _email?.build();
        _$failedField = 'nonFieldErrors';
        _nonFieldErrors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RegisterBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$LoginBadRequest extends LoginBadRequest {
  @override
  final BuiltList<String> username;
  @override
  final BuiltList<String> password;
  @override
  final BuiltList<String> nonFieldErrors;

  factory _$LoginBadRequest([void Function(LoginBadRequestBuilder) updates]) =>
      (new LoginBadRequestBuilder()..update(updates)).build();

  _$LoginBadRequest._({this.username, this.password, this.nonFieldErrors})
      : super._();

  @override
  LoginBadRequest rebuild(void Function(LoginBadRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBadRequestBuilder toBuilder() =>
      new LoginBadRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginBadRequest &&
        username == other.username &&
        password == other.password &&
        nonFieldErrors == other.nonFieldErrors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, username.hashCode), password.hashCode),
        nonFieldErrors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginBadRequest')
          ..add('username', username)
          ..add('password', password)
          ..add('nonFieldErrors', nonFieldErrors))
        .toString();
  }
}

class LoginBadRequestBuilder
    implements Builder<LoginBadRequest, LoginBadRequestBuilder> {
  _$LoginBadRequest _$v;

  ListBuilder<String> _username;
  ListBuilder<String> get username =>
      _$this._username ??= new ListBuilder<String>();
  set username(ListBuilder<String> username) => _$this._username = username;

  ListBuilder<String> _password;
  ListBuilder<String> get password =>
      _$this._password ??= new ListBuilder<String>();
  set password(ListBuilder<String> password) => _$this._password = password;

  ListBuilder<String> _nonFieldErrors;
  ListBuilder<String> get nonFieldErrors =>
      _$this._nonFieldErrors ??= new ListBuilder<String>();
  set nonFieldErrors(ListBuilder<String> nonFieldErrors) =>
      _$this._nonFieldErrors = nonFieldErrors;

  LoginBadRequestBuilder();

  LoginBadRequestBuilder get _$this {
    if (_$v != null) {
      _username = _$v.username?.toBuilder();
      _password = _$v.password?.toBuilder();
      _nonFieldErrors = _$v.nonFieldErrors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginBadRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginBadRequest;
  }

  @override
  void update(void Function(LoginBadRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginBadRequest build() {
    _$LoginBadRequest _$result;
    try {
      _$result = _$v ??
          new _$LoginBadRequest._(
              username: _username?.build(),
              password: _password?.build(),
              nonFieldErrors: _nonFieldErrors?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'username';
        _username?.build();
        _$failedField = 'password';
        _password?.build();
        _$failedField = 'nonFieldErrors';
        _nonFieldErrors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginBadRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
