// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_rtc.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const WebRTCType _$answer = const WebRTCType._('answer');
const WebRTCType _$offer = const WebRTCType._('offer');

WebRTCType _$webRTCTypeValueOf(String name) {
  switch (name) {
    case 'answer':
      return _$answer;
    case 'offer':
      return _$offer;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WebRTCType> _$webRTCTypeValues =
    new BuiltSet<WebRTCType>(const <WebRTCType>[
  _$answer,
  _$offer,
]);

Serializer<WebRTCOffer> _$webRTCOfferSerializer = new _$WebRTCOfferSerializer();
Serializer<WebRTCAnswer> _$webRTCAnswerSerializer =
    new _$WebRTCAnswerSerializer();
Serializer<WebRTCType> _$webRTCTypeSerializer = new _$WebRTCTypeSerializer();
Serializer<WebRTCReject> _$webRTCRejectSerializer =
    new _$WebRTCRejectSerializer();
Serializer<WebRTCIceCandidate> _$webRTCIceCandidateSerializer =
    new _$WebRTCIceCandidateSerializer();
Serializer<WebRTCHangUp> _$webRTCHangUpSerializer =
    new _$WebRTCHangUpSerializer();

class _$WebRTCOfferSerializer implements StructuredSerializer<WebRTCOffer> {
  @override
  final Iterable<Type> types = const [WebRTCOffer, _$WebRTCOffer];
  @override
  final String wireName = 'WebRTCOffer';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebRTCOffer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'sdp',
      serializers.serialize(object.sdp, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(WebRTCType)),
    ];

    return result;
  }

  @override
  WebRTCOffer deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebRTCOfferBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sdp':
          result.sdp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(WebRTCType)) as WebRTCType;
          break;
      }
    }

    return result.build();
  }
}

class _$WebRTCAnswerSerializer implements StructuredSerializer<WebRTCAnswer> {
  @override
  final Iterable<Type> types = const [WebRTCAnswer, _$WebRTCAnswer];
  @override
  final String wireName = 'WebRTCAnswer';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebRTCAnswer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'sdp',
      serializers.serialize(object.sdp, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(WebRTCType)),
    ];

    return result;
  }

  @override
  WebRTCAnswer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebRTCAnswerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sdp':
          result.sdp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(WebRTCType)) as WebRTCType;
          break;
      }
    }

    return result.build();
  }
}

class _$WebRTCTypeSerializer implements PrimitiveSerializer<WebRTCType> {
  @override
  final Iterable<Type> types = const <Type>[WebRTCType];
  @override
  final String wireName = 'WebRTCType';

  @override
  Object serialize(Serializers serializers, WebRTCType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  WebRTCType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WebRTCType.valueOf(serialized as String);
}

class _$WebRTCRejectSerializer implements StructuredSerializer<WebRTCReject> {
  @override
  final Iterable<Type> types = const [WebRTCReject, _$WebRTCReject];
  @override
  final String wireName = 'WebRTCReject';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebRTCReject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebRTCReject deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebRTCRejectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebRTCIceCandidateSerializer
    implements StructuredSerializer<WebRTCIceCandidate> {
  @override
  final Iterable<Type> types = const [WebRTCIceCandidate, _$WebRTCIceCandidate];
  @override
  final String wireName = 'WebRTCIceCandidate';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, WebRTCIceCandidate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'sdpMLineIndex',
      serializers.serialize(object.sdpMLineIndex,
          specifiedType: const FullType(int)),
      'sdpMid',
      serializers.serialize(object.sdpMid,
          specifiedType: const FullType(String)),
      'candidate',
      serializers.serialize(object.candidate,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebRTCIceCandidate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebRTCIceCandidateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sdpMLineIndex':
          result.sdpMLineIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sdpMid':
          result.sdpMid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'candidate':
          result.candidate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebRTCHangUpSerializer implements StructuredSerializer<WebRTCHangUp> {
  @override
  final Iterable<Type> types = const [WebRTCHangUp, _$WebRTCHangUp];
  @override
  final String wireName = 'WebRTCHangUp';

  @override
  Iterable<Object?> serialize(Serializers serializers, WebRTCHangUp object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WebRTCHangUp deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebRTCHangUpBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebRTCOffer extends WebRTCOffer {
  @override
  final String userId;
  @override
  final String sdp;
  @override
  final WebRTCType type;

  factory _$WebRTCOffer([void Function(WebRTCOfferBuilder)? updates]) =>
      (new WebRTCOfferBuilder()..update(updates)).build();

  _$WebRTCOffer._({required this.userId, required this.sdp, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'WebRTCOffer', 'userId');
    BuiltValueNullFieldError.checkNotNull(sdp, 'WebRTCOffer', 'sdp');
    BuiltValueNullFieldError.checkNotNull(type, 'WebRTCOffer', 'type');
  }

  @override
  WebRTCOffer rebuild(void Function(WebRTCOfferBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebRTCOfferBuilder toBuilder() => new WebRTCOfferBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebRTCOffer &&
        userId == other.userId &&
        sdp == other.sdp &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, userId.hashCode), sdp.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebRTCOffer')
          ..add('userId', userId)
          ..add('sdp', sdp)
          ..add('type', type))
        .toString();
  }
}

class WebRTCOfferBuilder implements Builder<WebRTCOffer, WebRTCOfferBuilder> {
  _$WebRTCOffer? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  String? _sdp;

  String? get sdp => _$this._sdp;

  set sdp(String? sdp) => _$this._sdp = sdp;

  WebRTCType? _type;

  WebRTCType? get type => _$this._type;

  set type(WebRTCType? type) => _$this._type = type;

  WebRTCOfferBuilder();

  WebRTCOfferBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _sdp = $v.sdp;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebRTCOffer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebRTCOffer;
  }

  @override
  void update(void Function(WebRTCOfferBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebRTCOffer build() {
    final _$result = _$v ??
        new _$WebRTCOffer._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'WebRTCOffer', 'userId'),
            sdp: BuiltValueNullFieldError.checkNotNull(
                sdp, 'WebRTCOffer', 'sdp'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'WebRTCOffer', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$WebRTCAnswer extends WebRTCAnswer {
  @override
  final String userId;
  @override
  final String sdp;
  @override
  final WebRTCType type;

  factory _$WebRTCAnswer([void Function(WebRTCAnswerBuilder)? updates]) =>
      (new WebRTCAnswerBuilder()..update(updates)).build();

  _$WebRTCAnswer._(
      {required this.userId, required this.sdp, required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'WebRTCAnswer', 'userId');
    BuiltValueNullFieldError.checkNotNull(sdp, 'WebRTCAnswer', 'sdp');
    BuiltValueNullFieldError.checkNotNull(type, 'WebRTCAnswer', 'type');
  }

  @override
  WebRTCAnswer rebuild(void Function(WebRTCAnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebRTCAnswerBuilder toBuilder() => new WebRTCAnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebRTCAnswer &&
        userId == other.userId &&
        sdp == other.sdp &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, userId.hashCode), sdp.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebRTCAnswer')
          ..add('userId', userId)
          ..add('sdp', sdp)
          ..add('type', type))
        .toString();
  }
}

class WebRTCAnswerBuilder
    implements Builder<WebRTCAnswer, WebRTCAnswerBuilder> {
  _$WebRTCAnswer? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  String? _sdp;

  String? get sdp => _$this._sdp;

  set sdp(String? sdp) => _$this._sdp = sdp;

  WebRTCType? _type;

  WebRTCType? get type => _$this._type;

  set type(WebRTCType? type) => _$this._type = type;

  WebRTCAnswerBuilder();

  WebRTCAnswerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _sdp = $v.sdp;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebRTCAnswer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebRTCAnswer;
  }

  @override
  void update(void Function(WebRTCAnswerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebRTCAnswer build() {
    final _$result = _$v ??
        new _$WebRTCAnswer._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'WebRTCAnswer', 'userId'),
            sdp: BuiltValueNullFieldError.checkNotNull(
                sdp, 'WebRTCAnswer', 'sdp'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'WebRTCAnswer', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$WebRTCReject extends WebRTCReject {
  @override
  final String userId;

  factory _$WebRTCReject([void Function(WebRTCRejectBuilder)? updates]) =>
      (new WebRTCRejectBuilder()..update(updates)).build();

  _$WebRTCReject._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'WebRTCReject', 'userId');
  }

  @override
  WebRTCReject rebuild(void Function(WebRTCRejectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebRTCRejectBuilder toBuilder() => new WebRTCRejectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebRTCReject && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebRTCReject')..add('userId', userId))
        .toString();
  }
}

class WebRTCRejectBuilder
    implements Builder<WebRTCReject, WebRTCRejectBuilder> {
  _$WebRTCReject? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  WebRTCRejectBuilder();

  WebRTCRejectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebRTCReject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebRTCReject;
  }

  @override
  void update(void Function(WebRTCRejectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebRTCReject build() {
    final _$result = _$v ??
        new _$WebRTCReject._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'WebRTCReject', 'userId'));
    replace(_$result);
    return _$result;
  }
}

class _$WebRTCIceCandidate extends WebRTCIceCandidate {
  @override
  final String userId;
  @override
  final int sdpMLineIndex;
  @override
  final String sdpMid;
  @override
  final String candidate;

  factory _$WebRTCIceCandidate(
          [void Function(WebRTCIceCandidateBuilder)? updates]) =>
      (new WebRTCIceCandidateBuilder()..update(updates)).build();

  _$WebRTCIceCandidate._(
      {required this.userId,
      required this.sdpMLineIndex,
      required this.sdpMid,
      required this.candidate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        userId, 'WebRTCIceCandidate', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        sdpMLineIndex, 'WebRTCIceCandidate', 'sdpMLineIndex');
    BuiltValueNullFieldError.checkNotNull(
        sdpMid, 'WebRTCIceCandidate', 'sdpMid');
    BuiltValueNullFieldError.checkNotNull(
        candidate, 'WebRTCIceCandidate', 'candidate');
  }

  @override
  WebRTCIceCandidate rebuild(
          void Function(WebRTCIceCandidateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebRTCIceCandidateBuilder toBuilder() =>
      new WebRTCIceCandidateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebRTCIceCandidate &&
        userId == other.userId &&
        sdpMLineIndex == other.sdpMLineIndex &&
        sdpMid == other.sdpMid &&
        candidate == other.candidate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), sdpMLineIndex.hashCode),
            sdpMid.hashCode),
        candidate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebRTCIceCandidate')
          ..add('userId', userId)
          ..add('sdpMLineIndex', sdpMLineIndex)
          ..add('sdpMid', sdpMid)
          ..add('candidate', candidate))
        .toString();
  }
}

class WebRTCIceCandidateBuilder
    implements Builder<WebRTCIceCandidate, WebRTCIceCandidateBuilder> {
  _$WebRTCIceCandidate? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  int? _sdpMLineIndex;

  int? get sdpMLineIndex => _$this._sdpMLineIndex;

  set sdpMLineIndex(int? sdpMLineIndex) =>
      _$this._sdpMLineIndex = sdpMLineIndex;

  String? _sdpMid;

  String? get sdpMid => _$this._sdpMid;

  set sdpMid(String? sdpMid) => _$this._sdpMid = sdpMid;

  String? _candidate;

  String? get candidate => _$this._candidate;

  set candidate(String? candidate) => _$this._candidate = candidate;

  WebRTCIceCandidateBuilder();

  WebRTCIceCandidateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _sdpMLineIndex = $v.sdpMLineIndex;
      _sdpMid = $v.sdpMid;
      _candidate = $v.candidate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebRTCIceCandidate other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebRTCIceCandidate;
  }

  @override
  void update(void Function(WebRTCIceCandidateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebRTCIceCandidate build() {
    final _$result = _$v ??
        new _$WebRTCIceCandidate._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'WebRTCIceCandidate', 'userId'),
            sdpMLineIndex: BuiltValueNullFieldError.checkNotNull(
                sdpMLineIndex, 'WebRTCIceCandidate', 'sdpMLineIndex'),
            sdpMid: BuiltValueNullFieldError.checkNotNull(
                sdpMid, 'WebRTCIceCandidate', 'sdpMid'),
            candidate: BuiltValueNullFieldError.checkNotNull(
                candidate, 'WebRTCIceCandidate', 'candidate'));
    replace(_$result);
    return _$result;
  }
}

class _$WebRTCHangUp extends WebRTCHangUp {
  @override
  final String userId;

  factory _$WebRTCHangUp([void Function(WebRTCHangUpBuilder)? updates]) =>
      (new WebRTCHangUpBuilder()..update(updates)).build();

  _$WebRTCHangUp._({required this.userId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'WebRTCHangUp', 'userId');
  }

  @override
  WebRTCHangUp rebuild(void Function(WebRTCHangUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebRTCHangUpBuilder toBuilder() => new WebRTCHangUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebRTCHangUp && userId == other.userId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, userId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebRTCHangUp')..add('userId', userId))
        .toString();
  }
}

class WebRTCHangUpBuilder
    implements Builder<WebRTCHangUp, WebRTCHangUpBuilder> {
  _$WebRTCHangUp? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  WebRTCHangUpBuilder();

  WebRTCHangUpBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebRTCHangUp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebRTCHangUp;
  }

  @override
  void update(void Function(WebRTCHangUpBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebRTCHangUp build() {
    final _$result = _$v ??
        new _$WebRTCHangUp._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'WebRTCHangUp', 'userId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
