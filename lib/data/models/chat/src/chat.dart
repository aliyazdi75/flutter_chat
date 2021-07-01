import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'message.dart';
import 'serializers.dart';

part 'chat.g.dart';

abstract class Chat implements Built<Chat, ChatBuilder> {
  BuiltList<Message> get messages;

  DateTime get lastSeen;

  bool get isOnline;

  Chat._();

  factory Chat([void Function(ChatBuilder) updates]) = _$Chat;

  static Chat fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Chat.serializer, json)!;
  }

  static Serializer<Chat> get serializer => _$chatSerializer;
}

abstract class OpenChatInputBody
    implements Built<OpenChatInputBody, OpenChatInputBodyBuilder> {
  String? get userId;

  int? get containerId;

  OpenChatInputBody._();

  factory OpenChatInputBody([void Function(OpenChatInputBodyBuilder) updates]) =
      _$OpenChatInputBody;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(OpenChatInputBody.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<OpenChatInputBody> get serializer =>
      _$openChatInputBodySerializer;
}

abstract class GetMessagesInputQuery
    implements Built<GetMessagesInputQuery, GetMessagesInputQueryBuilder> {
  int? get minId;

  int? get maxId;

  int? get count;

  GetMessagesInputQuery._();

  factory GetMessagesInputQuery(
          [void Function(GetMessagesInputQueryBuilder) updates]) =
      _$GetMessagesInputQuery;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(GetMessagesInputQuery.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<GetMessagesInputQuery> get serializer =>
      _$getMessagesInputQuerySerializer;
}

abstract class ChatReadInputBody
    implements Built<ChatReadInputBody, ChatReadInputBodyBuilder> {
  int get containerId;

  bool get read;

  ChatReadInputBody._();

  factory ChatReadInputBody([void Function(ChatReadInputBodyBuilder) updates]) =
      _$ChatReadInputBody;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ChatReadInputBody.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<ChatReadInputBody> get serializer =>
      _$chatReadInputBodySerializer;
}

abstract class CloseChatInputBody
    implements Built<CloseChatInputBody, CloseChatInputBodyBuilder> {
  String? get userId;

  int? get containerId;

  CloseChatInputBody._();

  factory CloseChatInputBody(
          [void Function(CloseChatInputBodyBuilder) updates]) =
      _$CloseChatInputBody;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CloseChatInputBody.serializer, this)
        as Map<String, dynamic>;
  }

  static Serializer<CloseChatInputBody> get serializer =>
      _$closeChatInputBodySerializer;
}

abstract class GetMessageResponse
    implements Built<GetMessageResponse, GetMessageResponseBuilder> {
  BuiltList<Message> get messages;

  GetMessageResponse._();

  factory GetMessageResponse(
          [void Function(GetMessageResponseBuilder) updates]) =
      _$GetMessageResponse;

  static GetMessageResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(GetMessageResponse.serializer, json)!;
  }

  static Serializer<GetMessageResponse> get serializer =>
      _$getMessageResponseSerializer;
}

abstract class ChatStatusChange
    implements Built<ChatStatusChange, ChatStatusChangeBuilder> {
  String get userId;

  bool get online;

  int get lastSeen;

  ChatStatusChange._();

  factory ChatStatusChange([void Function(ChatStatusChangeBuilder) updates]) =
      _$ChatStatusChange;

  static ChatStatusChange fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatStatusChange.serializer, json)!;
  }

  static Serializer<ChatStatusChange> get serializer =>
      _$chatStatusChangeSerializer;
}

abstract class ChatMessageReceive
    implements Built<ChatMessageReceive, ChatMessageReceiveBuilder> {
  int get id;

  @BuiltValueField(wireName: 'sender')
  String get senderId;

  MessageType get type;

  String get text;

  int get date;

  ChatMessageReceive._();

  factory ChatMessageReceive(
          [void Function(ChatMessageReceiveBuilder) updates]) =
      _$ChatMessageReceive;

  static ChatMessageReceive fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatMessageReceive.serializer, json)!;
  }

  static Serializer<ChatMessageReceive> get serializer =>
      _$chatMessageReceiveSerializer;
}

abstract class ChatSeen implements Built<ChatSeen, ChatSeenBuilder> {
  String get userId;

  int get lastId;

  ChatSeen._();

  factory ChatSeen([void Function(ChatSeenBuilder) updates]) = _$ChatSeen;

  static ChatSeen fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatSeen.serializer, json)!;
  }

  static Serializer<ChatSeen> get serializer => _$chatSeenSerializer;
}

abstract class ChatIsTyping
    implements Built<ChatIsTyping, ChatIsTypingBuilder> {
  String get userId;

  bool get isTyping;

  ChatIsTyping._();

  factory ChatIsTyping([void Function(ChatIsTypingBuilder) updates]) =
      _$ChatIsTyping;

  static ChatIsTyping fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatIsTyping.serializer, json)!;
  }

  static Serializer<ChatIsTyping> get serializer => _$chatIsTypingSerializer;
}

abstract class SocketChatMessageReceive
    implements
        Built<SocketChatMessageReceive, SocketChatMessageReceiveBuilder> {
  int get id;

  String get text;

  SocketChatMessageReceive._();

  factory SocketChatMessageReceive(
          [void Function(SocketChatMessageReceiveBuilder) updates]) =
      _$SocketChatMessageReceive;

  static SocketChatMessageReceive fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(
        SocketChatMessageReceive.serializer, json)!;
  }

  static Serializer<SocketChatMessageReceive> get serializer =>
      _$socketChatMessageReceiveSerializer;
}
