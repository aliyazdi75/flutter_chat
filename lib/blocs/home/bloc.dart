import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/repositories/home/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
    required this.socketRepository,
    required this.authenticationBloc,
  }) : super(const HomeState());

  final HomeRepository homeRepository;
  final SocketRepository socketRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetChatListRequested) {
      yield* _mapGetChatListRequestedToState();
    } else if (event is StatusChanged) {
      yield* _mapStatusChangedToState(event);
    } else if (event is LoggedOutRequested) {
      yield* _mapLoggedOutRequestedToState();
    } else if (event is MessageReceived) {
      yield* _mapMessageReceivedToState(event);
    } else if (event is ChatSeenReceived) {
      yield* _mapChatSeenReceivedToState(event);
    } else if (event is IsTypingReceived) {
      yield* _mapIsTypingReceivedToState(event);
    } else if (event is UpdateChatInfoRequested) {
      yield* _mapUpdateChatInfoRequestedToState(event);
    } else if (event is UpdateNewMessageCountRequested) {
      yield* _mapUpdateNewMessageCountRequestedToState(event);
    }
  }

  @override
  Future<void> close() async {
    homeRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await super.close();
  }

  Stream<HomeState> _mapGetChatListRequestedToState() async* {
    yield state.copyWith(status: HomeStatus.loading);

    try {
      final chatsList = await homeRepository.getChatsList();
      final chats = chatsList.chats.toList();
      _listenOnHub();
      yield state.copyWith(status: HomeStatus.success, chats: chats);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: HomeStatus.failure);
    } on UnauthorisedException {
      print('sik kon');
      authenticationBloc.add(const UnauthorizedRequested());
    } on Exception {
      yield state.copyWith(status: HomeStatus.failure);
    }
  }

  Stream<HomeState> _mapLoggedOutRequestedToState() async* {
    yield state.copyWith(status: HomeStatus.logOutLoading);

    try {
      authenticationBloc.add(const AuthenticationLoggedOutRequested());
    } on Exception {
      yield state.copyWith(status: HomeStatus.failure);
    }
  }

  void _listenOnHub() {
    final hubConnection = socketRepository.hubConnection;
    homeRepository.listenOnStatusChanged(
      hubConnection: hubConnection,
      onStatusChanged: (chatStatusChange) =>
          add(StatusChanged(chatStatusChange)),
    );
    homeRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) =>
          add(MessageReceived(chatMessageReceive)),
    );
    homeRepository.listenOnChatSeen(
      hubConnection: hubConnection,
      onChatSeen: (chatSeen) => add(ChatSeenReceived(chatSeen)),
    );
    homeRepository.listenOnChatIsTyping(
      hubConnection: hubConnection,
      onChatIsTyping: (chatIsTyping) => add(IsTypingReceived(chatIsTyping)),
    );
  }

  Stream<HomeState> _mapStatusChangedToState(StatusChanged event) async* {
    final chat = state.chats.singleWhereOrNull(
      (chat) => event.onStatusChanged.userId == chat.userId,
    );
    if (chat != null) {
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = chat.rebuild(
            (b) => b
              ..isOnline = event.onStatusChanged.online
              ..lastSeen = DateTime.fromMillisecondsSinceEpoch(
                  event.onStatusChanged.lastSeen),
          ),
      );
    }
  }

  Stream<HomeState> _mapMessageReceivedToState(MessageReceived event) async* {
    final chat = state.chats.singleWhereOrNull(
      (chat) => event.onChatMessageReceived.senderId == chat.userId,
    );
    if (chat != null) {
      final message = Message(
        (b) => b
          ..id = event.onChatMessageReceived.id
          ..seen = false
          ..sentByMe = false
          ..isSent = true
          ..sentAt = DateTime.fromMillisecondsSinceEpoch(
              event.onChatMessageReceived.date)
          ..type = MessageType.text
          ..text = event.onChatMessageReceived.text,
      );
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = chat.rebuild(
            (b) => b
              ..newMessagesCount = chat.newMessagesCount + 1
              ..lastMessage = message.toBuilder(),
          ),
      );
    }
  }

  Stream<HomeState> _mapChatSeenReceivedToState(ChatSeenReceived event) async* {
    final chat = state.chats.firstWhereOrNull(
      (chat) => event.onMessageSeen.userId == chat.userId,
    );
    if (chat != null) {
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = chat.rebuild(
            (b) => b..lastMessage.seen = true,
          ),
      );
    }
  }

  Stream<HomeState> _mapIsTypingReceivedToState(IsTypingReceived event) async* {
    final chat = state.chats.firstWhereOrNull(
      (chat) => event.onChatIsTyping.userId == chat.userId,
    );
    if (chat != null) {
      yield state.copyWith(chats: List.of(state.chats));
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = chat.rebuild(
            (b) => b..isTyping = event.onChatIsTyping.isTyping,
          ),
      );
    }
  }

  Stream<HomeState> _mapUpdateChatInfoRequestedToState(
      UpdateChatInfoRequested event) async* {
    final chat = state.chats.firstWhereOrNull(
      (chat) => event.chatInfo.userId == chat.userId,
    );
    if (chat != null) {
      chat.rebuild((b) => b..newMessagesCount = 0);
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = event.chatInfo,
      );
    }
  }

  Stream<HomeState> _mapUpdateNewMessageCountRequestedToState(
      UpdateNewMessageCountRequested event) async* {
    final chat = state.chats.firstWhereOrNull(
      (chat) => event.chatInfo.userId == chat.userId,
    );
    if (chat != null) {
      chat.rebuild((b) => b..newMessagesCount = 0);
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexOf(chat)] = chat.rebuild(
            (b) => b..newMessagesCount = 0,
          ),
      );
    }
  }
}
