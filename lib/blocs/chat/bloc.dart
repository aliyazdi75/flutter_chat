import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/repositories/chat/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    @required this.chatInfo,
    @required this.chatRepository,
    @required this.socketRepository,
  })  : assert(chatInfo != null),
        assert(chatRepository != null),
        assert(socketRepository != null),
        super(
          ChatState(
            messages: [chatInfo.lastMessage] ?? <Message>[],
            isTyping: chatInfo.isTyping,
            isOnline: chatInfo.isOnline,
            lastSeen: chatInfo.lastSeen,
          ),
        );

  final ChatInfo chatInfo;
  final ChatRepository chatRepository;
  final SocketRepository socketRepository;

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is OpenChatRequested) {
      yield* _mapOpenChatRequestedToState(event);
    } else if (event is GetMessagesRequested) {
      yield* _mapGetMessagesRequestedToState(event);
    } else if (event is ReadChatRequested) {
      yield* _mapReadChatRequestedToState(event);
    } else if (event is CloseChatRequested) {
      yield* _mapCloseChatRequestedToState(event);
    } else if (event is SendChatMessageRequested) {
      yield* _mapSendChatMessageRequestedToState(event);
    } else if (event is SendUserIsTypingRequested) {
      yield* _mapSendUserIsTypingRequestedToState();
    } else if (event is SendUserChatSeenRequested) {
      yield* _mapSendUserChatSeenRequestedToState();
    }
  }

  Stream<ChatState> _mapOpenChatRequestedToState(
      OpenChatRequested event) async* {
    yield state.copyWith(status: ChatStatus.openChatLoading);

    try {
      final chat =
          await chatRepository.openChat(containerId: chatInfo.containerId);
      await chatRepository.readChat(containerId: chatInfo.containerId);
      _listenOnHub();
      yield state.copyWith(
        status: ChatStatus.success,
        messages: chat.messages.toList(),
        isOnline: chat.isOnline,
        lastSeen: chat.lastSeen,
      );
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  void _listenOnHub() {
    final hubConnection = socketRepository.hubConnection;
    chatRepository.listenOnStatusChange(
      hubConnection: hubConnection,
      onStatusChange: (onStatusChange) => onStatusChange.userId !=
              chatInfo.userId
          ? null
          : state.copyWith(
              isOnline: onStatusChange.online,
              lastSeen:
                  DateTime.fromMillisecondsSinceEpoch(onStatusChange.lastSeen),
            ),
    );
    chatRepository.listenOnChatTyping(
      hubConnection: hubConnection,
      onChatTyping: (onChatTyping) => onChatTyping.userId != chatInfo.userId
          ? null
          : state.copyWith(isTyping: onChatTyping.isTyping),
    );
    chatRepository.listenOnMessageSeen(
      hubConnection: hubConnection,
      onMessageSeen: (onMessageSeen) => onMessageSeen.userId != chatInfo.userId
          ? null
          : state.messages
              .forEach((message) => message.rebuild((b) => b..seen = true)),
    );
    chatRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) =>
          chatMessageReceive.senderId != chatInfo.userId
              ? null
              //todo: check whether if works for changing
              : state.messages.add(
                  Message(
                    (b) => b
                      ..id = chatMessageReceive.id
                      ..seen = true
                      ..sentByMe = false
                      ..type = chatMessageReceive.type
                      ..text = chatMessageReceive.text
                      ..sentAt = DateTime.fromMillisecondsSinceEpoch(
                          chatMessageReceive.date),
                  ),
                ),
    );
  }

  Stream<ChatState> _mapGetMessagesRequestedToState(
      GetMessagesRequested event) async* {
    yield state.copyWith(status: ChatStatus.getMessagesLoading);

    try {
      final getMessages = await chatRepository.getMessages(
        userId: chatInfo.userId,
        maxId: event.maxId,
      );
      state.messages.addAll(getMessages.messages.toList());
      yield state.copyWith(status: ChatStatus.success);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapReadChatRequestedToState(
      ReadChatRequested event) async* {
    try {
      await chatRepository.readChat(
        containerId: chatInfo.containerId,
        read: event.read,
      );
      //todo: check whether if this change for parent bloc
      chatInfo.rebuild((b) => b..isUnread = !event.read);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapCloseChatRequestedToState(
      CloseChatRequested event) async* {
    try {
      await chatRepository.closeChat(containerId: chatInfo.containerId);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapSendChatMessageRequestedToState(
      SendChatMessageRequested event) async* {
    try {
      final message = Message(
        (b) => b
          ..seen = false
          ..sentByMe = true
          ..isSent = false
          ..sentAt = DateTime.now()
          ..type = MessageType.text
          ..text = event.messageText,
      );
      state.copyWith(messages: List.of(state.messages)..add(message));
      //todo: check whether if this change for parent bloc
      chatInfo.lastMessage.rebuild((b) => b = message.toBuilder());
      final messageId = await chatRepository.sendChatMessage(
        hubConnection: socketRepository.hubConnection,
        userId: chatInfo.userId,
        message: event.messageText,
      );
      //todo: check whether if this change for parent bloc
      message.rebuild(
        (b) => b
          ..id = messageId
          ..isSent = true,
      );
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapSendUserIsTypingRequestedToState() async* {
    //todo: handle timer for idle typing
    try {
      await chatRepository.sendUserIsTyping(
        hubConnection: socketRepository.hubConnection,
        userId: chatInfo.userId,
      );
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapSendUserChatSeenRequestedToState() async* {
    try {
      await chatRepository.sendUserChatSeen(
        hubConnection: socketRepository.hubConnection,
        userId: chatInfo.userId,
        lastMessageId: state.messages.last.id,
      );
    } on Exception catch (_) {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }
}
