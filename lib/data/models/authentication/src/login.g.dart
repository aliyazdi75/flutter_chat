// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginRequest> _$loginRequestSerializer =
    new _$LoginRequestSerializer();

class _$LoginRequestSerializer implements StructuredSerializer<LoginRequest> {
  @override
  final Iterable<Type> types = const [LoginRequest, _$LoginRequest];
  @override
  final String wireName = 'LoginRequest';

  @override
  Iterable<Object?> serialize(Serializers serializers, LoginRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
      'deviceId',
      serializers.serialize(object.deviceId,
          specifiedType: const FullType(String)),
      'deviceName',
      serializers.serialize(object.deviceName,
          specifiedType: const FullType(String)),
      'deviceFriendlyName',
      serializers.serialize(object.deviceFriendlyName,
          specifiedType: const FullType(String)),
      'deviceVersion',
      serializers.serialize(object.deviceVersion,
          specifiedType: const FullType(String)),
      'deviceOS',
      serializers.serialize(object.deviceOS,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  LoginRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginRequestBuilder();

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
        case 'deviceId':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deviceName':
          result.deviceName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deviceFriendlyName':
          result.deviceFriendlyName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deviceVersion':
          result.deviceVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deviceOS':
          result.deviceOS = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginRequest extends LoginRequest {
  @override
  final String email;
  @override
  final String password;
  @override
  final String deviceId;
  @override
  final String deviceName;
  @override
  final String deviceFriendlyName;
  @override
  final String deviceVersion;
  @override
  final String deviceOS;

  factory _$LoginRequest([void Function(LoginRequestBuilder)? updates]) =>
      (new LoginRequestBuilder()..update(updates)).build();

  _$LoginRequest._(
      {required this.email,
      required this.password,
      required this.deviceId,
      required this.deviceName,
      required this.deviceFriendlyName,
      required this.deviceVersion,
      required this.deviceOS})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, 'LoginRequest', 'email');
    BuiltValueNullFieldError.checkNotNull(password, 'LoginRequest', 'password');
    BuiltValueNullFieldError.checkNotNull(deviceId, 'LoginRequest', 'deviceId');
    BuiltValueNullFieldError.checkNotNull(
        deviceName, 'LoginRequest', 'deviceName');
    BuiltValueNullFieldError.checkNotNull(
        deviceFriendlyName, 'LoginRequest', 'deviceFriendlyName');
    BuiltValueNullFieldError.checkNotNull(
        deviceVersion, 'LoginRequest', 'deviceVersion');
    BuiltValueNullFieldError.checkNotNull(deviceOS, 'LoginRequest', 'deviceOS');
  }

  @override
  LoginRequest rebuild(void Function(LoginRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginRequestBuilder toBuilder() => new LoginRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginRequest &&
        email == other.email &&
        password == other.password &&
        deviceId == other.deviceId &&
        deviceName == other.deviceName &&
        deviceFriendlyName == other.deviceFriendlyName &&
        deviceVersion == other.deviceVersion &&
        deviceOS == other.deviceOS;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, email.hashCode), password.hashCode),
                        deviceId.hashCode),
                    deviceName.hashCode),
                deviceFriendlyName.hashCode),
            deviceVersion.hashCode),
        deviceOS.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginRequest')
          ..add('email', email)
          ..add('password', password)
          ..add('deviceId', deviceId)
          ..add('deviceName', deviceName)
          ..add('deviceFriendlyName', deviceFriendlyName)
          ..add('deviceVersion', deviceVersion)
          ..add('deviceOS', deviceOS))
        .toString();
  }
}

class LoginRequestBuilder
    implements Builder<LoginRequest, LoginRequestBuilder> {
  _$LoginRequest? _$v;

  String? _email;

  String? get email => _$this._email;

  set email(String? email) => _$this._email = email;

  String? _password;

  String? get password => _$this._password;

  set password(String? password) => _$this._password = password;

  String? _deviceId;

  String? get deviceId => _$this._deviceId;

  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _deviceName;

  String? get deviceName => _$this._deviceName;

  set deviceName(String? deviceName) => _$this._deviceName = deviceName;

  String? _deviceFriendlyName;

  String? get deviceFriendlyName => _$this._deviceFriendlyName;

  set deviceFriendlyName(String? deviceFriendlyName) =>
      _$this._deviceFriendlyName = deviceFriendlyName;

  String? _deviceVersion;

  String? get deviceVersion => _$this._deviceVersion;

  set deviceVersion(String? deviceVersion) =>
      _$this._deviceVersion = deviceVersion;

  String? _deviceOS;

  String? get deviceOS => _$this._deviceOS;

  set deviceOS(String? deviceOS) => _$this._deviceOS = deviceOS;

  LoginRequestBuilder();

  LoginRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _deviceId = $v.deviceId;
      _deviceName = $v.deviceName;
      _deviceFriendlyName = $v.deviceFriendlyName;
      _deviceVersion = $v.deviceVersion;
      _deviceOS = $v.deviceOS;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginRequest;
  }

  @override
  void update(void Function(LoginRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginRequest build() {
    final _$result = _$v ??
        new _$LoginRequest._(
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'LoginRequest', 'email'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'LoginRequest', 'password'),
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, 'LoginRequest', 'deviceId'),
            deviceName: BuiltValueNullFieldError.checkNotNull(
                deviceName, 'LoginRequest', 'deviceName'),
            deviceFriendlyName: BuiltValueNullFieldError.checkNotNull(
                deviceFriendlyName, 'LoginRequest', 'deviceFriendlyName'),
            deviceVersion: BuiltValueNullFieldError.checkNotNull(
                deviceVersion, 'LoginRequest', 'deviceVersion'),
            deviceOS: BuiltValueNullFieldError.checkNotNull(
                deviceOS, 'LoginRequest', 'deviceOS'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
