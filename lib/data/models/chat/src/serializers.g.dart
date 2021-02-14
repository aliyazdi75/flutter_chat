// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Chat.serializer)
      ..add(ChatInfo.serializer)
      ..add(ChatIsTyping.serializer)
      ..add(ChatList.serializer)
      ..add(ChatMessageReceive.serializer)
      ..add(ChatReadInputBody.serializer)
      ..add(ChatSeen.serializer)
      ..add(ChatStatusChange.serializer)
      ..add(CloseChatInputBody.serializer)
      ..add(GetMessagesInputQuery.serializer)
      ..add(Message.serializer)
      ..add(MessageType.serializer)
      ..add(OpenChatInputBody.serializer)
      ..add(SocketChatMessageReceive.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ChatInfo)]),
          () => new ListBuilder<ChatInfo>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Message)]),
          () => new ListBuilder<Message>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
