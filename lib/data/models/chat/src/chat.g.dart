// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Chat> _$chatSerializer = new _$ChatSerializer();
Serializer<OpenChatInputBody> _$openChatInputBodySerializer =
    new _$OpenChatInputBodySerializer();
Serializer<GetMessagesInputQuery> _$getMessagesInputQuerySerializer =
    new _$GetMessagesInputQuerySerializer();
Serializer<ChatReadInputBody> _$chatReadInputBodySerializer =
    new _$ChatReadInputBodySerializer();
Serializer<CloseChatInputBody> _$closeChatInputBodySerializer =
    new _$CloseChatInputBodySerializer();
Serializer<GetMessageResponse> _$getMessageResponseSerializer =
    new _$GetMessageResponseSerializer();
Serializer<ChatStatusChange> _$chatStatusChangeSerializer =
    new _$ChatStatusChangeSerializer();
Serializer<ChatMessageReceive> _$chatMessageReceiveSerializer =
    new _$ChatMessageReceiveSerializer();
Serializer<ChatSeen> _$chatSeenSerializer = new _$ChatSeenSerializer();
Serializer<ChatIsTyping> _$chatIsTypingSerializer =
    new _$ChatIsTypingSerializer();
Serializer<SocketChatMessageReceive> _$socketChatMessageReceiveSerializer =
    new _$SocketChatMessageReceiveSerializer();

class _$ChatSerializer implements StructuredSerializer<Chat> {
  @override
  final Iterable<Type> types = const [Chat, _$Chat];
  @override
  final String wireName = 'Chat';

  @override
  Iterable<Object?> serialize(Serializers serializers, Chat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'messages',
      serializers.serialize(object.messages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Message)])),
      'lastSeen',
      serializers.serialize(object.lastSeen,
          specifiedType: const FullType(DateTime)),
      'isOnline',
      serializers.serialize(object.isOnline,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  Chat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Message)]))!
              as BuiltList<Object?>);
          break;
        case 'lastSeen':
          result.lastSeen = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isOnline':
          result.isOnline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$OpenChatInputBodySerializer
    implements StructuredSerializer<OpenChatInputBody> {
  @override
  final Iterable<Type> types = const [OpenChatInputBody, _$OpenChatInputBody];
  @override
  final String wireName = 'OpenChatInputBody';

  @override
  Iterable<Object?> serialize(Serializers serializers, OpenChatInputBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.containerId;
    if (value != null) {
      result
        ..add('containerId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  OpenChatInputBody deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OpenChatInputBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'containerId':
          result.containerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GetMessagesInputQuerySerializer
    implements StructuredSerializer<GetMessagesInputQuery> {
  @override
  final Iterable<Type> types = const [
    GetMessagesInputQuery,
    _$GetMessagesInputQuery
  ];
  @override
  final String wireName = 'GetMessagesInputQuery';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetMessagesInputQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.minId;
    if (value != null) {
      result
        ..add('minId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxId;
    if (value != null) {
      result
        ..add('maxId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GetMessagesInputQuery deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetMessagesInputQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'minId':
          result.minId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'maxId':
          result.maxId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatReadInputBodySerializer
    implements StructuredSerializer<ChatReadInputBody> {
  @override
  final Iterable<Type> types = const [ChatReadInputBody, _$ChatReadInputBody];
  @override
  final String wireName = 'ChatReadInputBody';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatReadInputBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'containerId',
      serializers.serialize(object.containerId,
          specifiedType: const FullType(int)),
      'read',
      serializers.serialize(object.read, specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ChatReadInputBody deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatReadInputBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'containerId':
          result.containerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'read':
          result.read = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$CloseChatInputBodySerializer
    implements StructuredSerializer<CloseChatInputBody> {
  @override
  final Iterable<Type> types = const [CloseChatInputBody, _$CloseChatInputBody];
  @override
  final String wireName = 'CloseChatInputBody';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CloseChatInputBody object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.containerId;
    if (value != null) {
      result
        ..add('containerId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CloseChatInputBody deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CloseChatInputBodyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'containerId':
          result.containerId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$GetMessageResponseSerializer
    implements StructuredSerializer<GetMessageResponse> {
  @override
  final Iterable<Type> types = const [GetMessageResponse, _$GetMessageResponse];
  @override
  final String wireName = 'GetMessageResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GetMessageResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'messages',
      serializers.serialize(object.messages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Message)])),
    ];

    return result;
  }

  @override
  GetMessageResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GetMessageResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Message)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatStatusChangeSerializer
    implements StructuredSerializer<ChatStatusChange> {
  @override
  final Iterable<Type> types = const [ChatStatusChange, _$ChatStatusChange];
  @override
  final String wireName = 'ChatStatusChange';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatStatusChange object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'online',
      serializers.serialize(object.online, specifiedType: const FullType(bool)),
      'lastSeen',
      serializers.serialize(object.lastSeen,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ChatStatusChange deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatStatusChangeBuilder();

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
        case 'online':
          result.online = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastSeen':
          result.lastSeen = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatMessageReceiveSerializer
    implements StructuredSerializer<ChatMessageReceive> {
  @override
  final Iterable<Type> types = const [ChatMessageReceive, _$ChatMessageReceive];
  @override
  final String wireName = 'ChatMessageReceive';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChatMessageReceive object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'sender',
      serializers.serialize(object.senderId,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MessageType)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ChatMessageReceive deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatMessageReceiveBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sender':
          result.senderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(MessageType)) as MessageType;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatSeenSerializer implements StructuredSerializer<ChatSeen> {
  @override
  final Iterable<Type> types = const [ChatSeen, _$ChatSeen];
  @override
  final String wireName = 'ChatSeen';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatSeen object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'lastId',
      serializers.serialize(object.lastId, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ChatSeen deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatSeenBuilder();

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
        case 'lastId':
          result.lastId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ChatIsTypingSerializer implements StructuredSerializer<ChatIsTyping> {
  @override
  final Iterable<Type> types = const [ChatIsTyping, _$ChatIsTyping];
  @override
  final String wireName = 'ChatIsTyping';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatIsTyping object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'isTyping',
      serializers.serialize(object.isTyping,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  ChatIsTyping deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatIsTypingBuilder();

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
        case 'isTyping':
          result.isTyping = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SocketChatMessageReceiveSerializer
    implements StructuredSerializer<SocketChatMessageReceive> {
  @override
  final Iterable<Type> types = const [
    SocketChatMessageReceive,
    _$SocketChatMessageReceive
  ];
  @override
  final String wireName = 'SocketChatMessageReceive';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SocketChatMessageReceive object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SocketChatMessageReceive deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SocketChatMessageReceiveBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$Chat extends Chat {
  @override
  final BuiltList<Message> messages;
  @override
  final DateTime lastSeen;
  @override
  final bool isOnline;

  factory _$Chat([void Function(ChatBuilder)? updates]) =>
      (new ChatBuilder()..update(updates)).build();

  _$Chat._(
      {required this.messages, required this.lastSeen, required this.isOnline})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(messages, 'Chat', 'messages');
    BuiltValueNullFieldError.checkNotNull(lastSeen, 'Chat', 'lastSeen');
    BuiltValueNullFieldError.checkNotNull(isOnline, 'Chat', 'isOnline');
  }

  @override
  Chat rebuild(void Function(ChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatBuilder toBuilder() => new ChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chat &&
        messages == other.messages &&
        lastSeen == other.lastSeen &&
        isOnline == other.isOnline;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, messages.hashCode), lastSeen.hashCode), isOnline.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Chat')
          ..add('messages', messages)
          ..add('lastSeen', lastSeen)
          ..add('isOnline', isOnline))
        .toString();
  }
}

class ChatBuilder implements Builder<Chat, ChatBuilder> {
  _$Chat? _$v;

  ListBuilder<Message>? _messages;

  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();

  set messages(ListBuilder<Message>? messages) => _$this._messages = messages;

  DateTime? _lastSeen;

  DateTime? get lastSeen => _$this._lastSeen;

  set lastSeen(DateTime? lastSeen) => _$this._lastSeen = lastSeen;

  bool? _isOnline;

  bool? get isOnline => _$this._isOnline;

  set isOnline(bool? isOnline) => _$this._isOnline = isOnline;

  ChatBuilder();

  ChatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messages = $v.messages.toBuilder();
      _lastSeen = $v.lastSeen;
      _isOnline = $v.isOnline;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Chat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Chat;
  }

  @override
  void update(void Function(ChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Chat build() {
    _$Chat _$result;
    try {
      _$result = _$v ??
          new _$Chat._(
              messages: messages.build(),
              lastSeen: BuiltValueNullFieldError.checkNotNull(
                  lastSeen, 'Chat', 'lastSeen'),
              isOnline: BuiltValueNullFieldError.checkNotNull(
                  isOnline, 'Chat', 'isOnline'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Chat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OpenChatInputBody extends OpenChatInputBody {
  @override
  final String? userId;
  @override
  final int? containerId;

  factory _$OpenChatInputBody(
          [void Function(OpenChatInputBodyBuilder)? updates]) =>
      (new OpenChatInputBodyBuilder()..update(updates)).build();

  _$OpenChatInputBody._({this.userId, this.containerId}) : super._();

  @override
  OpenChatInputBody rebuild(void Function(OpenChatInputBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OpenChatInputBodyBuilder toBuilder() =>
      new OpenChatInputBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OpenChatInputBody &&
        userId == other.userId &&
        containerId == other.containerId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), containerId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OpenChatInputBody')
          ..add('userId', userId)
          ..add('containerId', containerId))
        .toString();
  }
}

class OpenChatInputBodyBuilder
    implements Builder<OpenChatInputBody, OpenChatInputBodyBuilder> {
  _$OpenChatInputBody? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  int? _containerId;

  int? get containerId => _$this._containerId;

  set containerId(int? containerId) => _$this._containerId = containerId;

  OpenChatInputBodyBuilder();

  OpenChatInputBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _containerId = $v.containerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OpenChatInputBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OpenChatInputBody;
  }

  @override
  void update(void Function(OpenChatInputBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OpenChatInputBody build() {
    final _$result = _$v ??
        new _$OpenChatInputBody._(userId: userId, containerId: containerId);
    replace(_$result);
    return _$result;
  }
}

class _$GetMessagesInputQuery extends GetMessagesInputQuery {
  @override
  final int? minId;
  @override
  final int? maxId;
  @override
  final int? count;

  factory _$GetMessagesInputQuery(
          [void Function(GetMessagesInputQueryBuilder)? updates]) =>
      (new GetMessagesInputQueryBuilder()..update(updates)).build();

  _$GetMessagesInputQuery._({this.minId, this.maxId, this.count}) : super._();

  @override
  GetMessagesInputQuery rebuild(
          void Function(GetMessagesInputQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMessagesInputQueryBuilder toBuilder() =>
      new GetMessagesInputQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMessagesInputQuery &&
        minId == other.minId &&
        maxId == other.maxId &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, minId.hashCode), maxId.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetMessagesInputQuery')
          ..add('minId', minId)
          ..add('maxId', maxId)
          ..add('count', count))
        .toString();
  }
}

class GetMessagesInputQueryBuilder
    implements Builder<GetMessagesInputQuery, GetMessagesInputQueryBuilder> {
  _$GetMessagesInputQuery? _$v;

  int? _minId;

  int? get minId => _$this._minId;

  set minId(int? minId) => _$this._minId = minId;

  int? _maxId;

  int? get maxId => _$this._maxId;

  set maxId(int? maxId) => _$this._maxId = maxId;

  int? _count;

  int? get count => _$this._count;

  set count(int? count) => _$this._count = count;

  GetMessagesInputQueryBuilder();

  GetMessagesInputQueryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _minId = $v.minId;
      _maxId = $v.maxId;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetMessagesInputQuery other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMessagesInputQuery;
  }

  @override
  void update(void Function(GetMessagesInputQueryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetMessagesInputQuery build() {
    final _$result = _$v ??
        new _$GetMessagesInputQuery._(minId: minId, maxId: maxId, count: count);
    replace(_$result);
    return _$result;
  }
}

class _$ChatReadInputBody extends ChatReadInputBody {
  @override
  final int containerId;
  @override
  final bool read;

  factory _$ChatReadInputBody(
          [void Function(ChatReadInputBodyBuilder)? updates]) =>
      (new ChatReadInputBodyBuilder()..update(updates)).build();

  _$ChatReadInputBody._({required this.containerId, required this.read})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        containerId, 'ChatReadInputBody', 'containerId');
    BuiltValueNullFieldError.checkNotNull(read, 'ChatReadInputBody', 'read');
  }

  @override
  ChatReadInputBody rebuild(void Function(ChatReadInputBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatReadInputBodyBuilder toBuilder() =>
      new ChatReadInputBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatReadInputBody &&
        containerId == other.containerId &&
        read == other.read;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, containerId.hashCode), read.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatReadInputBody')
          ..add('containerId', containerId)
          ..add('read', read))
        .toString();
  }
}

class ChatReadInputBodyBuilder
    implements Builder<ChatReadInputBody, ChatReadInputBodyBuilder> {
  _$ChatReadInputBody? _$v;

  int? _containerId;

  int? get containerId => _$this._containerId;

  set containerId(int? containerId) => _$this._containerId = containerId;

  bool? _read;

  bool? get read => _$this._read;

  set read(bool? read) => _$this._read = read;

  ChatReadInputBodyBuilder();

  ChatReadInputBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _containerId = $v.containerId;
      _read = $v.read;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatReadInputBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatReadInputBody;
  }

  @override
  void update(void Function(ChatReadInputBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatReadInputBody build() {
    final _$result = _$v ??
        new _$ChatReadInputBody._(
            containerId: BuiltValueNullFieldError.checkNotNull(
                containerId, 'ChatReadInputBody', 'containerId'),
            read: BuiltValueNullFieldError.checkNotNull(
                read, 'ChatReadInputBody', 'read'));
    replace(_$result);
    return _$result;
  }
}

class _$CloseChatInputBody extends CloseChatInputBody {
  @override
  final String? userId;
  @override
  final int? containerId;

  factory _$CloseChatInputBody(
          [void Function(CloseChatInputBodyBuilder)? updates]) =>
      (new CloseChatInputBodyBuilder()..update(updates)).build();

  _$CloseChatInputBody._({this.userId, this.containerId}) : super._();

  @override
  CloseChatInputBody rebuild(
          void Function(CloseChatInputBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CloseChatInputBodyBuilder toBuilder() =>
      new CloseChatInputBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CloseChatInputBody &&
        userId == other.userId &&
        containerId == other.containerId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), containerId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CloseChatInputBody')
          ..add('userId', userId)
          ..add('containerId', containerId))
        .toString();
  }
}

class CloseChatInputBodyBuilder
    implements Builder<CloseChatInputBody, CloseChatInputBodyBuilder> {
  _$CloseChatInputBody? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  int? _containerId;

  int? get containerId => _$this._containerId;

  set containerId(int? containerId) => _$this._containerId = containerId;

  CloseChatInputBodyBuilder();

  CloseChatInputBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _containerId = $v.containerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CloseChatInputBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CloseChatInputBody;
  }

  @override
  void update(void Function(CloseChatInputBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CloseChatInputBody build() {
    final _$result = _$v ??
        new _$CloseChatInputBody._(userId: userId, containerId: containerId);
    replace(_$result);
    return _$result;
  }
}

class _$GetMessageResponse extends GetMessageResponse {
  @override
  final BuiltList<Message> messages;

  factory _$GetMessageResponse(
          [void Function(GetMessageResponseBuilder)? updates]) =>
      (new GetMessageResponseBuilder()..update(updates)).build();

  _$GetMessageResponse._({required this.messages}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        messages, 'GetMessageResponse', 'messages');
  }

  @override
  GetMessageResponse rebuild(
          void Function(GetMessageResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMessageResponseBuilder toBuilder() =>
      new GetMessageResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMessageResponse && messages == other.messages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, messages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetMessageResponse')
          ..add('messages', messages))
        .toString();
  }
}

class GetMessageResponseBuilder
    implements Builder<GetMessageResponse, GetMessageResponseBuilder> {
  _$GetMessageResponse? _$v;

  ListBuilder<Message>? _messages;

  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();

  set messages(ListBuilder<Message>? messages) => _$this._messages = messages;

  GetMessageResponseBuilder();

  GetMessageResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messages = $v.messages.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetMessageResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetMessageResponse;
  }

  @override
  void update(void Function(GetMessageResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetMessageResponse build() {
    _$GetMessageResponse _$result;
    try {
      _$result = _$v ?? new _$GetMessageResponse._(messages: messages.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GetMessageResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatStatusChange extends ChatStatusChange {
  @override
  final String userId;
  @override
  final bool online;
  @override
  final int lastSeen;

  factory _$ChatStatusChange(
          [void Function(ChatStatusChangeBuilder)? updates]) =>
      (new ChatStatusChangeBuilder()..update(updates)).build();

  _$ChatStatusChange._(
      {required this.userId, required this.online, required this.lastSeen})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'ChatStatusChange', 'userId');
    BuiltValueNullFieldError.checkNotNull(online, 'ChatStatusChange', 'online');
    BuiltValueNullFieldError.checkNotNull(
        lastSeen, 'ChatStatusChange', 'lastSeen');
  }

  @override
  ChatStatusChange rebuild(void Function(ChatStatusChangeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatStatusChangeBuilder toBuilder() =>
      new ChatStatusChangeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatStatusChange &&
        userId == other.userId &&
        online == other.online &&
        lastSeen == other.lastSeen;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, userId.hashCode), online.hashCode), lastSeen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatStatusChange')
          ..add('userId', userId)
          ..add('online', online)
          ..add('lastSeen', lastSeen))
        .toString();
  }
}

class ChatStatusChangeBuilder
    implements Builder<ChatStatusChange, ChatStatusChangeBuilder> {
  _$ChatStatusChange? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  bool? _online;

  bool? get online => _$this._online;

  set online(bool? online) => _$this._online = online;

  int? _lastSeen;

  int? get lastSeen => _$this._lastSeen;

  set lastSeen(int? lastSeen) => _$this._lastSeen = lastSeen;

  ChatStatusChangeBuilder();

  ChatStatusChangeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _online = $v.online;
      _lastSeen = $v.lastSeen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatStatusChange other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatStatusChange;
  }

  @override
  void update(void Function(ChatStatusChangeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatStatusChange build() {
    final _$result = _$v ??
        new _$ChatStatusChange._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'ChatStatusChange', 'userId'),
            online: BuiltValueNullFieldError.checkNotNull(
                online, 'ChatStatusChange', 'online'),
            lastSeen: BuiltValueNullFieldError.checkNotNull(
                lastSeen, 'ChatStatusChange', 'lastSeen'));
    replace(_$result);
    return _$result;
  }
}

class _$ChatMessageReceive extends ChatMessageReceive {
  @override
  final int id;
  @override
  final String senderId;
  @override
  final MessageType type;
  @override
  final String text;
  @override
  final int date;

  factory _$ChatMessageReceive(
          [void Function(ChatMessageReceiveBuilder)? updates]) =>
      (new ChatMessageReceiveBuilder()..update(updates)).build();

  _$ChatMessageReceive._(
      {required this.id,
      required this.senderId,
      required this.type,
      required this.text,
      required this.date})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'ChatMessageReceive', 'id');
    BuiltValueNullFieldError.checkNotNull(
        senderId, 'ChatMessageReceive', 'senderId');
    BuiltValueNullFieldError.checkNotNull(type, 'ChatMessageReceive', 'type');
    BuiltValueNullFieldError.checkNotNull(text, 'ChatMessageReceive', 'text');
    BuiltValueNullFieldError.checkNotNull(date, 'ChatMessageReceive', 'date');
  }

  @override
  ChatMessageReceive rebuild(
          void Function(ChatMessageReceiveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatMessageReceiveBuilder toBuilder() =>
      new ChatMessageReceiveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatMessageReceive &&
        id == other.id &&
        senderId == other.senderId &&
        type == other.type &&
        text == other.text &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), senderId.hashCode), type.hashCode),
            text.hashCode),
        date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatMessageReceive')
          ..add('id', id)
          ..add('senderId', senderId)
          ..add('type', type)
          ..add('text', text)
          ..add('date', date))
        .toString();
  }
}

class ChatMessageReceiveBuilder
    implements Builder<ChatMessageReceive, ChatMessageReceiveBuilder> {
  _$ChatMessageReceive? _$v;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _senderId;

  String? get senderId => _$this._senderId;

  set senderId(String? senderId) => _$this._senderId = senderId;

  MessageType? _type;

  MessageType? get type => _$this._type;

  set type(MessageType? type) => _$this._type = type;

  String? _text;

  String? get text => _$this._text;

  set text(String? text) => _$this._text = text;

  int? _date;

  int? get date => _$this._date;

  set date(int? date) => _$this._date = date;

  ChatMessageReceiveBuilder();

  ChatMessageReceiveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _senderId = $v.senderId;
      _type = $v.type;
      _text = $v.text;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatMessageReceive other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatMessageReceive;
  }

  @override
  void update(void Function(ChatMessageReceiveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatMessageReceive build() {
    final _$result = _$v ??
        new _$ChatMessageReceive._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'ChatMessageReceive', 'id'),
            senderId: BuiltValueNullFieldError.checkNotNull(
                senderId, 'ChatMessageReceive', 'senderId'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'ChatMessageReceive', 'type'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, 'ChatMessageReceive', 'text'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, 'ChatMessageReceive', 'date'));
    replace(_$result);
    return _$result;
  }
}

class _$ChatSeen extends ChatSeen {
  @override
  final String userId;
  @override
  final int lastId;

  factory _$ChatSeen([void Function(ChatSeenBuilder)? updates]) =>
      (new ChatSeenBuilder()..update(updates)).build();

  _$ChatSeen._({required this.userId, required this.lastId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'ChatSeen', 'userId');
    BuiltValueNullFieldError.checkNotNull(lastId, 'ChatSeen', 'lastId');
  }

  @override
  ChatSeen rebuild(void Function(ChatSeenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatSeenBuilder toBuilder() => new ChatSeenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatSeen &&
        userId == other.userId &&
        lastId == other.lastId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), lastId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatSeen')
          ..add('userId', userId)
          ..add('lastId', lastId))
        .toString();
  }
}

class ChatSeenBuilder implements Builder<ChatSeen, ChatSeenBuilder> {
  _$ChatSeen? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  int? _lastId;

  int? get lastId => _$this._lastId;

  set lastId(int? lastId) => _$this._lastId = lastId;

  ChatSeenBuilder();

  ChatSeenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _lastId = $v.lastId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatSeen other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatSeen;
  }

  @override
  void update(void Function(ChatSeenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatSeen build() {
    final _$result = _$v ??
        new _$ChatSeen._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'ChatSeen', 'userId'),
            lastId: BuiltValueNullFieldError.checkNotNull(
                lastId, 'ChatSeen', 'lastId'));
    replace(_$result);
    return _$result;
  }
}

class _$ChatIsTyping extends ChatIsTyping {
  @override
  final String userId;
  @override
  final bool isTyping;

  factory _$ChatIsTyping([void Function(ChatIsTypingBuilder)? updates]) =>
      (new ChatIsTypingBuilder()..update(updates)).build();

  _$ChatIsTyping._({required this.userId, required this.isTyping}) : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, 'ChatIsTyping', 'userId');
    BuiltValueNullFieldError.checkNotNull(isTyping, 'ChatIsTyping', 'isTyping');
  }

  @override
  ChatIsTyping rebuild(void Function(ChatIsTypingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatIsTypingBuilder toBuilder() => new ChatIsTypingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatIsTyping &&
        userId == other.userId &&
        isTyping == other.isTyping;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userId.hashCode), isTyping.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatIsTyping')
          ..add('userId', userId)
          ..add('isTyping', isTyping))
        .toString();
  }
}

class ChatIsTypingBuilder
    implements Builder<ChatIsTyping, ChatIsTypingBuilder> {
  _$ChatIsTyping? _$v;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  bool? _isTyping;

  bool? get isTyping => _$this._isTyping;

  set isTyping(bool? isTyping) => _$this._isTyping = isTyping;

  ChatIsTypingBuilder();

  ChatIsTypingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _isTyping = $v.isTyping;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatIsTyping other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatIsTyping;
  }

  @override
  void update(void Function(ChatIsTypingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatIsTyping build() {
    final _$result = _$v ??
        new _$ChatIsTyping._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'ChatIsTyping', 'userId'),
            isTyping: BuiltValueNullFieldError.checkNotNull(
                isTyping, 'ChatIsTyping', 'isTyping'));
    replace(_$result);
    return _$result;
  }
}

class _$SocketChatMessageReceive extends SocketChatMessageReceive {
  @override
  final int id;
  @override
  final String text;

  factory _$SocketChatMessageReceive(
          [void Function(SocketChatMessageReceiveBuilder)? updates]) =>
      (new SocketChatMessageReceiveBuilder()..update(updates)).build();

  _$SocketChatMessageReceive._({required this.id, required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'SocketChatMessageReceive', 'id');
    BuiltValueNullFieldError.checkNotNull(
        text, 'SocketChatMessageReceive', 'text');
  }

  @override
  SocketChatMessageReceive rebuild(
          void Function(SocketChatMessageReceiveBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocketChatMessageReceiveBuilder toBuilder() =>
      new SocketChatMessageReceiveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocketChatMessageReceive &&
        id == other.id &&
        text == other.text;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), text.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SocketChatMessageReceive')
          ..add('id', id)
          ..add('text', text))
        .toString();
  }
}

class SocketChatMessageReceiveBuilder
    implements
        Builder<SocketChatMessageReceive, SocketChatMessageReceiveBuilder> {
  _$SocketChatMessageReceive? _$v;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _text;

  String? get text => _$this._text;

  set text(String? text) => _$this._text = text;

  SocketChatMessageReceiveBuilder();

  SocketChatMessageReceiveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocketChatMessageReceive other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocketChatMessageReceive;
  }

  @override
  void update(void Function(SocketChatMessageReceiveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SocketChatMessageReceive build() {
    final _$result = _$v ??
        new _$SocketChatMessageReceive._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, 'SocketChatMessageReceive', 'id'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, 'SocketChatMessageReceive', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
