import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'message.dart';
import 'serializers.dart';

part 'list.g.dart';

abstract class ChatList implements Built<ChatList, ChatListBuilder> {
  @BuiltValueField(wireName: 'directs')
  BuiltList<ChatInfo> get chats;

  ChatList._();

  factory ChatList([void Function(ChatListBuilder) updates]) = _$ChatList;

  static ChatList fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatList.serializer, json)!;
  }

  static Serializer<ChatList> get serializer => _$chatListSerializer;
}

abstract class ChatInfo implements Built<ChatInfo, ChatInfoBuilder> {
  int get containerId;

  String get firstName;

  String get userId;

  int get newMessagesCount;

  bool get isUnread;

  bool get isOnline;

  bool get isTyping;

  DateTime? get lastSeen;

  Message? get lastMessage;

  ChatInfo._();

  factory ChatInfo([void Function(ChatInfoBuilder) updates]) = _$ChatInfo;

  static void _initializeBuilder(ChatInfoBuilder builder) => builder
    ..isTyping = false
    ..isOnline = false;

  static ChatInfo fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ChatInfo.serializer, json)!;
  }

  static Serializer<ChatInfo> get serializer => _$chatInfoSerializer;
}
