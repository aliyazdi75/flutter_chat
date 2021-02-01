// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MessageType _$text = const MessageType._('text');
const MessageType _$image = const MessageType._('image');
const MessageType _$video = const MessageType._('video');
const MessageType _$constantName = const MessageType._('constantName');

MessageType _$messageTypeValueOf(String name) {
  switch (name) {
    case 'text':
      return _$text;
    case 'image':
      return _$image;
    case 'video':
      return _$video;
    case 'constantName':
      return _$constantName;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MessageType> _$messageTypeValues =
    new BuiltSet<MessageType>(const <MessageType>[
  _$text,
  _$image,
  _$video,
  _$constantName,
]);

Serializer<Message> _$messageSerializer = new _$MessageSerializer();
Serializer<MessageType> _$messageTypeSerializer = new _$MessageTypeSerializer();

class _$MessageSerializer implements StructuredSerializer<Message> {
  @override
  final Iterable<Type> types = const [Message, _$Message];
  @override
  final String wireName = 'Message';

  @override
  Iterable<Object> serialize(Serializers serializers, Message object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'seen',
      serializers.serialize(object.seen, specifiedType: const FullType(bool)),
      'sentByMe',
      serializers.serialize(object.sentByMe,
          specifiedType: const FullType(bool)),
      'isSent',
      serializers.serialize(object.isSent, specifiedType: const FullType(bool)),
      'sentAt',
      serializers.serialize(object.sentAt,
          specifiedType: const FullType(DateTime)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MessageType)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Message deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'seen':
          result.seen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'sentByMe':
          result.sentByMe = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isSent':
          result.isSent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'sentAt':
          result.sentAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(MessageType)) as MessageType;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MessageTypeSerializer implements PrimitiveSerializer<MessageType> {
  @override
  final Iterable<Type> types = const <Type>[MessageType];
  @override
  final String wireName = 'MessageType';

  @override
  Object serialize(Serializers serializers, MessageType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MessageType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MessageType.valueOf(serialized as String);
}

class _$Message extends Message {
  @override
  final int id;
  @override
  final bool seen;
  @override
  final bool sentByMe;
  @override
  final bool isSent;
  @override
  final DateTime sentAt;
  @override
  final MessageType type;
  @override
  final String text;

  factory _$Message([void Function(MessageBuilder) updates]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._(
      {this.id,
      this.seen,
      this.sentByMe,
      this.isSent,
      this.sentAt,
      this.type,
      this.text})
      : super._() {
    if (seen == null) {
      throw new BuiltValueNullFieldError('Message', 'seen');
    }
    if (sentByMe == null) {
      throw new BuiltValueNullFieldError('Message', 'sentByMe');
    }
    if (isSent == null) {
      throw new BuiltValueNullFieldError('Message', 'isSent');
    }
    if (sentAt == null) {
      throw new BuiltValueNullFieldError('Message', 'sentAt');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Message', 'type');
    }
    if (text == null) {
      throw new BuiltValueNullFieldError('Message', 'text');
    }
  }

  @override
  Message rebuild(void Function(MessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        seen == other.seen &&
        sentByMe == other.sentByMe &&
        isSent == other.isSent &&
        sentAt == other.sentAt &&
        type == other.type &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), seen.hashCode),
                        sentByMe.hashCode),
                    isSent.hashCode),
                sentAt.hashCode),
            type.hashCode),
        text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('id', id)
          ..add('seen', seen)
          ..add('sentByMe', sentByMe)
          ..add('isSent', isSent)
          ..add('sentAt', sentAt)
          ..add('type', type)
          ..add('text', text))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _seen;
  bool get seen => _$this._seen;
  set seen(bool seen) => _$this._seen = seen;

  bool _sentByMe;
  bool get sentByMe => _$this._sentByMe;
  set sentByMe(bool sentByMe) => _$this._sentByMe = sentByMe;

  bool _isSent;
  bool get isSent => _$this._isSent;
  set isSent(bool isSent) => _$this._isSent = isSent;

  DateTime _sentAt;
  DateTime get sentAt => _$this._sentAt;
  set sentAt(DateTime sentAt) => _$this._sentAt = sentAt;

  MessageType _type;
  MessageType get type => _$this._type;
  set type(MessageType type) => _$this._type = type;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  MessageBuilder() {
    Message._initializeBuilder(this);
  }

  MessageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _seen = _$v.seen;
      _sentByMe = _$v.sentByMe;
      _isSent = _$v.isSent;
      _sentAt = _$v.sentAt;
      _type = _$v.type;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Message;
  }

  @override
  void update(void Function(MessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    final _$result = _$v ??
        new _$Message._(
            id: id,
            seen: seen,
            sentByMe: sentByMe,
            isSent: isSent,
            sentAt: sentAt,
            type: type,
            text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
