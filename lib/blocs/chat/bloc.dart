import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/home/bloc.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/repositories/chat/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

//todo: add lazy loading
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required ChatInfo chatInfo,
    required this.chatRepository,
    required this.socketRepository,
    required this.authenticationBloc,
    required this.homeBloc,
  }) : super(
          ChatState(
            messages: chatInfo.lastMessage == null
                ? <Message>[]
                : [chatInfo.lastMessage],
            chatInfo: chatInfo,
            isTyping: chatInfo.isTyping,
            isOnline: chatInfo.isOnline,
            lastSeen: chatInfo.lastSeen,
          ),
        );

  final ChatRepository chatRepository;
  final SocketRepository socketRepository;
  final AuthenticationBloc authenticationBloc;
  final HomeBloc homeBloc;

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is OpenChatRequested) {
      yield* _mapOpenChatRequestedToState(event);
    } else if (event is GetMessagesRequested) {
      yield* _mapGetMessagesRequestedToState(event);
    } else if (event is ReadChatRequested) {
      yield* _mapReadChatRequestedToState(event);
    } else if (event is StatusChanged) {
      yield* _mapStatusChangedToState(event);
    } else if (event is MessageReceived) {
      yield* _mapMessageReceivedToState(event);
    } else if (event is ChatSeenReceived) {
      yield* _mapChatSeenReceivedToState(event);
    } else if (event is IsTypingReceived) {
      yield* _mapIsTypingReceivedToState(event);
    } else if (event is SendChatMessageRequested) {
      yield* _mapSendChatMessageRequestedToState(event);
    } else if (event is SendUserChatSeenRequested) {
      yield* _mapSendUserChatSeenRequestedToState();
    } else if (event is TextMessageChanged) {
      yield* _mapTextMessageChangedToState(event);
    }
  }

  @override
  Future<void> close() async {
    chatRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await chatRepository.closeChat(containerId: state.chatInfo!.containerId);
    await super.close();
  }

  Stream<ChatState> _mapOpenChatRequestedToState(
      OpenChatRequested event) async* {
    yield state.copyWith(status: ChatStatus.openChatLoading);

    try {
      final chat = await chatRepository.openChat(
          containerId: state.chatInfo!.containerId);
      _listenOnHub();
      yield state.copyWith(
        status: ChatStatus.success,
        messages: chat.messages.toList(),
        isOnline: chat.isOnline,
        lastSeen: chat.lastSeen,
      );
      await chatRepository.readChat(containerId: state.chatInfo!.containerId);
      await _seenMessages();
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on UnauthorisedException {
      print('sik kon');
      authenticationBloc.add(const UnauthorizedRequested());
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  void _listenOnHub() {
    final hubConnection = socketRepository.hubConnection;
    chatRepository.listenOnStatusChanged(
      hubConnection: hubConnection,
      onStatusChanged: (chatStatusChange) =>
          add(StatusChanged(chatStatusChange)),
    );
    chatRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) =>
          add(MessageReceived(chatMessageReceive)),
    );
    chatRepository.listenOnChatSeen(
      hubConnection: hubConnection,
      onChatSeen: (chatSeen) => add(ChatSeenReceived(chatSeen)),
    );
    chatRepository.listenOnChatIsTyping(
      hubConnection: hubConnection,
      onChatIsTyping: (chatIsTyping) => add(IsTypingReceived(chatIsTyping)),
    );
  }

  Stream<ChatState> _mapStatusChangedToState(StatusChanged event) async* {
    if (event.onStatusChanged.userId == state.chatInfo!.userId) {
      yield state.copyWith(
        isOnline: event.onStatusChanged.online,
        lastSeen:
            DateTime.fromMillisecondsSinceEpoch(event.onStatusChanged.lastSeen),
      );
    }
  }

  Stream<ChatState> _mapMessageReceivedToState(MessageReceived event) async* {
    if (event.onChatMessageReceived.senderId == state.chatInfo!.userId) {
      //todo: should add some event like scroll or make new messages and separate seen message
      await _seenMessages();
      final message = Message(
        (b) => b
          ..id = event.onChatMessageReceived.id
          ..seen = true
          ..sentByMe = false
          ..type = event.onChatMessageReceived.type
          ..text = event.onChatMessageReceived.text
          ..sentAt = DateTime.fromMillisecondsSinceEpoch(
              event.onChatMessageReceived.date),
      );
      final chatInfo =
          state.chatInfo!.rebuild((b) => b..lastMessage = message.toBuilder());
      yield state.copyWith(
        chatInfo: chatInfo,
        messages: List.of(state.messages!)..insert(0, message),
      );
    }
  }

  //todo: why it called for twice for each first state and new state?
  Stream<ChatState> _mapChatSeenReceivedToState(ChatSeenReceived event) async* {
    if (event.onMessageSeen.userId == state.chatInfo!.userId) {
      yield state.copyWith(
        messages: List.of(state.messages!
            .map((message) => message!.rebuild((b) => b..seen = true))),
      );
    }
  }

  Stream<ChatState> _mapIsTypingReceivedToState(IsTypingReceived event) async* {
    //todo: handle timer for idle typing
    if (event.onChatIsTyping.userId == state.chatInfo!.userId) {
      yield state.copyWith(isTyping: event.onChatIsTyping.isTyping);
    }
  }

  Stream<ChatState> _mapGetMessagesRequestedToState(
      GetMessagesRequested event) async* {
    yield state.copyWith(status: ChatStatus.getMessagesLoading);

    try {
      final getMessages = await chatRepository.getMessages(
        userId: state.chatInfo!.userId,
        maxId: event.maxId,
      );
      state.messages!.addAll(getMessages.messages.toList());
      yield state.copyWith(status: ChatStatus.success);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on UnauthorisedException {
      print('sik kon');
      authenticationBloc.add(const UnauthorizedRequested());
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapReadChatRequestedToState(
      ReadChatRequested event) async* {
    try {
      await chatRepository.readChat(
        containerId: state.chatInfo!.containerId,
        read: event.read,
      );
      //todo: change read status of parent chat info
      state.copyWith(
          chatInfo: state.chatInfo!.rebuild((b) => b..isUnread = !event.read));
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: ChatStatus.failure);
    } on UnauthorisedException {
      print('sik kon');
      authenticationBloc.add(const UnauthorizedRequested());
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapSendChatMessageRequestedToState(
      SendChatMessageRequested event) async* {
    if (state.textMessage.isEmpty) return;
    try {
      // Create Message
      final message = Message(
        (b) => b
          ..seen = false
          ..sentByMe = true
          ..isSent = false
          ..sentAt = DateTime.now()
          ..type = MessageType.text
          ..text = state.textMessage,
      );

      // Update State
      final chatInfo =
          state.chatInfo!.rebuild((b) => b..lastMessage = message.toBuilder());
      yield state.copyWith(
          chatInfo: chatInfo,
          messages: List.of(state.messages!)..insert(0, message));

      // Update ChatInfo
      homeBloc.add(UpdateChatInfoRequested(chatInfo));

      // Send Message
      final socketMessage = await chatRepository.sendChatMessage(
        hubConnection: socketRepository.hubConnection,
        userId: state.chatInfo!.userId,
        message: state.textMessage,
      );

      // Update Sent Message
      final sentMessage = message.rebuild(
        (b) => b
          ..id = socketMessage.id
          ..isSent = true,
      );

      // Update State
      final sentChatInfo = state.chatInfo!
          .rebuild((b) => b..lastMessage = sentMessage.toBuilder());
      yield state.copyWith(
          chatInfo: sentChatInfo,
          messages: List.of(state.messages!)..first = sentMessage);

      // Update ChatInfo
      homeBloc.add(UpdateChatInfoRequested(sentChatInfo));
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapTextMessageChangedToState(
      TextMessageChanged event) async* {
    try {
      yield state.copyWith(textMessage: event.textMessage);
      await chatRepository.sendUserIsTyping(
        hubConnection: socketRepository.hubConnection,
        userId: state.chatInfo!.userId,
      );
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Stream<ChatState> _mapSendUserChatSeenRequestedToState() async* {
    try {
      await _seenMessages();
    } on Exception {
      yield state.copyWith(status: ChatStatus.failure);
    }
  }

  Future<void> _seenMessages() async {
    if (state.messages!.isNotEmpty) {
      await chatRepository.sendUserChatSeen(
        hubConnection: socketRepository.hubConnection,
        userId: state.chatInfo!.userId,
        lastMessageId: state.messages!.first!.id,
      );

      // Update ChatInfo new messages count
      homeBloc.add(UpdateNewMessageCountRequested(state.chatInfo!));
    }
  }
}
