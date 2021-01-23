// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Account> _$accountSerializer = new _$AccountSerializer();

class _$AccountSerializer implements StructuredSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];
  @override
  final String wireName = 'Account';

  @override
  Iterable<Object> serialize(Serializers serializers, Account object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'userName',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'emailConfirmed',
      serializers.serialize(object.emailConfirmed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Account deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userName':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailConfirmed':
          result.emailConfirmed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Account extends Account {
  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final bool emailConfirmed;

  factory _$Account([void Function(AccountBuilder) updates]) =>
      (new AccountBuilder()..update(updates)).build();

  _$Account._({this.id, this.username, this.email, this.emailConfirmed})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Account', 'id');
    }
    if (username == null) {
      throw new BuiltValueNullFieldError('Account', 'username');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Account', 'email');
    }
    if (emailConfirmed == null) {
      throw new BuiltValueNullFieldError('Account', 'emailConfirmed');
    }
  }

  @override
  Account rebuild(void Function(AccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => new AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        id == other.id &&
        username == other.username &&
        email == other.email &&
        emailConfirmed == other.emailConfirmed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), username.hashCode), email.hashCode),
        emailConfirmed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Account')
          ..add('id', id)
          ..add('username', username)
          ..add('email', email)
          ..add('emailConfirmed', emailConfirmed))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  bool _emailConfirmed;
  bool get emailConfirmed => _$this._emailConfirmed;
  set emailConfirmed(bool emailConfirmed) =>
      _$this._emailConfirmed = emailConfirmed;

  AccountBuilder();

  AccountBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _username = _$v.username;
      _email = _$v.email;
      _emailConfirmed = _$v.emailConfirmed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Account build() {
    final _$result = _$v ??
        new _$Account._(
            id: id,
            username: username,
            email: email,
            emailConfirmed: emailConfirmed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
