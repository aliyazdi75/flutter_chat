// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Register> _$registerSerializer = new _$RegisterSerializer();

class _$RegisterSerializer implements StructuredSerializer<Register> {
  @override
  final Iterable<Type> types = const [Register, _$Register];
  @override
  final String wireName = 'Register';

  @override
  Iterable<Object> serialize(Serializers serializers, Register object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Register deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Register extends Register {
  @override
  final String token;
  @override
  final int id;
  @override
  final String username;
  @override
  final String password;
  @override
  final String email;

  factory _$Register([void Function(RegisterBuilder) updates]) =>
      (new RegisterBuilder()..update(updates)).build();

  _$Register._({this.token, this.id, this.username, this.password, this.email})
      : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('Register', 'token');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Register', 'id');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('Register', 'username');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('Register', 'password');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Register', 'email');
    }
  }

  @override
  Register rebuild(void Function(RegisterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterBuilder toBuilder() => new RegisterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Register &&
        token == other.token &&
        id == other.id &&
        username == other.username &&
        password == other.password &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, token.hashCode), id.hashCode), username.hashCode),
            password.hashCode),
        email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Register')
          ..add('token', token)
          ..add('id', id)
          ..add('username', username)
          ..add('password', password)
          ..add('email', email))
        .toString();
  }
}

class RegisterBuilder implements Builder<Register, RegisterBuilder> {
  _$Register _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  RegisterBuilder();

  RegisterBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _id = _$v.id;
      _username = _$v.username;
      _password = _$v.password;
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Register other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Register;
  }

  @override
  void update(void Function(RegisterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Register build() {
    final _$result = _$v ??
        new _$Register._(
            token: token,
            id: id,
            username: username,
            password: password,
            email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
