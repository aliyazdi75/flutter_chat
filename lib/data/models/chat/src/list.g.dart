// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatList> _$chatListSerializer = new _$ChatListSerializer();
Serializer<ChatInfo> _$chatInfoSerializer = new _$ChatInfoSerializer();

class _$ChatListSerializer implements StructuredSerializer<ChatList> {
  @override
  final Iterable<Type> types = const [ChatList, _$ChatList];
  @override
  final String wireName = 'ChatList';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'directs',
      serializers.serialize(object.chats,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ChatInfo)])),
    ];

    return result;
  }

  @override
  ChatList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'directs':
          result.chats.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ChatInfo)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatInfoSerializer implements StructuredSerializer<ChatInfo> {
  @override
  final Iterable<Type> types = const [ChatInfo, _$ChatInfo];
  @override
  final String wireName = 'ChatInfo';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'containerId',
      serializers.serialize(object.containerId,
          specifiedType: const FullType(int)),
      'firstName',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'newMessagesCount',
      serializers.serialize(object.newMessagesCount,
          specifiedType: const FullType(int)),
      'isUnread',
      serializers.serialize(object.isUnread,
          specifiedType: const FullType(bool)),
      'isOnline',
      serializers.serialize(object.isOnline,
          specifiedType: const FullType(bool)),
      'isTyping',
      serializers.serialize(object.isTyping,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.lastSeen;
    if (value != null) {
      result
        ..add('lastSeen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('lastMessage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Message)));
    }
    return result;
  }

  @override
  ChatInfo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatInfoBuilder();

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
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'newMessagesCount':
          result.newMessagesCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'isUnread':
          result.isUnread = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isOnline':
          result.isOnline = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isTyping':
          result.isTyping = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'lastSeen':
          result.lastSeen = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lastMessage':
          result.lastMessage.replace(serializers.deserialize(value,
              specifiedType: const FullType(Message))! as Message);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatList extends ChatList {
  @override
  final BuiltList<ChatInfo> chats;

  factory _$ChatList([void Function(ChatListBuilder)? updates]) =>
      (new ChatListBuilder()..update(updates)).build();

  _$ChatList._({required this.chats}) : super._() {
    BuiltValueNullFieldError.checkNotNull(chats, 'ChatList', 'chats');
  }

  @override
  ChatList rebuild(void Function(ChatListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatListBuilder toBuilder() => new ChatListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatList && chats == other.chats;
  }

  @override
  int get hashCode {
    return $jf($jc(0, chats.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatList')..add('chats', chats))
        .toString();
  }
}

class ChatListBuilder implements Builder<ChatList, ChatListBuilder> {
  _$ChatList? _$v;

  ListBuilder<ChatInfo>? _chats;

  ListBuilder<ChatInfo> get chats =>
      _$this._chats ??= new ListBuilder<ChatInfo>();

  set chats(ListBuilder<ChatInfo>? chats) => _$this._chats = chats;

  ChatListBuilder();

  ChatListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chats = $v.chats.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatList;
  }

  @override
  void update(void Function(ChatListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatList build() {
    _$ChatList _$result;
    try {
      _$result = _$v ?? new _$ChatList._(chats: chats.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chats';
        chats.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChatInfo extends ChatInfo {
  @override
  final int containerId;
  @override
  final String firstName;
  @override
  final String userId;
  @override
  final int newMessagesCount;
  @override
  final bool isUnread;
  @override
  final bool isOnline;
  @override
  final bool isTyping;
  @override
  final DateTime? lastSeen;
  @override
  final Message? lastMessage;

  factory _$ChatInfo([void Function(ChatInfoBuilder)? updates]) =>
      (new ChatInfoBuilder()..update(updates)).build();

  _$ChatInfo._(
      {required this.containerId,
      required this.firstName,
      required this.userId,
      required this.newMessagesCount,
      required this.isUnread,
      required this.isOnline,
      required this.isTyping,
      this.lastSeen,
      this.lastMessage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        containerId, 'ChatInfo', 'containerId');
    BuiltValueNullFieldError.checkNotNull(firstName, 'ChatInfo', 'firstName');
    BuiltValueNullFieldError.checkNotNull(userId, 'ChatInfo', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        newMessagesCount, 'ChatInfo', 'newMessagesCount');
    BuiltValueNullFieldError.checkNotNull(isUnread, 'ChatInfo', 'isUnread');
    BuiltValueNullFieldError.checkNotNull(isOnline, 'ChatInfo', 'isOnline');
    BuiltValueNullFieldError.checkNotNull(isTyping, 'ChatInfo', 'isTyping');
  }

  @override
  ChatInfo rebuild(void Function(ChatInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatInfoBuilder toBuilder() => new ChatInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatInfo &&
        containerId == other.containerId &&
        firstName == other.firstName &&
        userId == other.userId &&
        newMessagesCount == other.newMessagesCount &&
        isUnread == other.isUnread &&
        isOnline == other.isOnline &&
        isTyping == other.isTyping &&
        lastSeen == other.lastSeen &&
        lastMessage == other.lastMessage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, containerId.hashCode),
                                    firstName.hashCode),
                                userId.hashCode),
                            newMessagesCount.hashCode),
                        isUnread.hashCode),
                    isOnline.hashCode),
                isTyping.hashCode),
            lastSeen.hashCode),
        lastMessage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatInfo')
          ..add('containerId', containerId)
          ..add('firstName', firstName)
          ..add('userId', userId)
          ..add('newMessagesCount', newMessagesCount)
          ..add('isUnread', isUnread)
          ..add('isOnline', isOnline)
          ..add('isTyping', isTyping)
          ..add('lastSeen', lastSeen)
          ..add('lastMessage', lastMessage))
        .toString();
  }
}

class ChatInfoBuilder implements Builder<ChatInfo, ChatInfoBuilder> {
  _$ChatInfo? _$v;

  int? _containerId;

  int? get containerId => _$this._containerId;

  set containerId(int? containerId) => _$this._containerId = containerId;

  String? _firstName;

  String? get firstName => _$this._firstName;

  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _userId;

  String? get userId => _$this._userId;

  set userId(String? userId) => _$this._userId = userId;

  int? _newMessagesCount;

  int? get newMessagesCount => _$this._newMessagesCount;

  set newMessagesCount(int? newMessagesCount) =>
      _$this._newMessagesCount = newMessagesCount;

  bool? _isUnread;

  bool? get isUnread => _$this._isUnread;

  set isUnread(bool? isUnread) => _$this._isUnread = isUnread;

  bool? _isOnline;

  bool? get isOnline => _$this._isOnline;

  set isOnline(bool? isOnline) => _$this._isOnline = isOnline;

  bool? _isTyping;

  bool? get isTyping => _$this._isTyping;

  set isTyping(bool? isTyping) => _$this._isTyping = isTyping;

  DateTime? _lastSeen;

  DateTime? get lastSeen => _$this._lastSeen;

  set lastSeen(DateTime? lastSeen) => _$this._lastSeen = lastSeen;

  MessageBuilder? _lastMessage;

  MessageBuilder get lastMessage =>
      _$this._lastMessage ??= new MessageBuilder();

  set lastMessage(MessageBuilder? lastMessage) =>
      _$this._lastMessage = lastMessage;

  ChatInfoBuilder() {
    ChatInfo._initializeBuilder(this);
  }

  ChatInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _containerId = $v.containerId;
      _firstName = $v.firstName;
      _userId = $v.userId;
      _newMessagesCount = $v.newMessagesCount;
      _isUnread = $v.isUnread;
      _isOnline = $v.isOnline;
      _isTyping = $v.isTyping;
      _lastSeen = $v.lastSeen;
      _lastMessage = $v.lastMessage?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatInfo;
  }

  @override
  void update(void Function(ChatInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatInfo build() {
    _$ChatInfo _$result;
    try {
      _$result = _$v ??
          new _$ChatInfo._(
              containerId: BuiltValueNullFieldError.checkNotNull(
                  containerId, 'ChatInfo', 'containerId'),
              firstName: BuiltValueNullFieldError.checkNotNull(
                  firstName, 'ChatInfo', 'firstName'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'ChatInfo', 'userId'),
              newMessagesCount: BuiltValueNullFieldError.checkNotNull(
                  newMessagesCount, 'ChatInfo', 'newMessagesCount'),
              isUnread: BuiltValueNullFieldError.checkNotNull(
                  isUnread, 'ChatInfo', 'isUnread'),
              isOnline: BuiltValueNullFieldError.checkNotNull(
                  isOnline, 'ChatInfo', 'isOnline'),
              isTyping: BuiltValueNullFieldError.checkNotNull(
                  isTyping, 'ChatInfo', 'isTyping'),
              lastSeen: lastSeen,
              lastMessage: _lastMessage?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lastMessage';
        _lastMessage?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
