import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/repositories/home/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    this.homeRepository,
    this.socketRepository,
  }) : super(const HomeState());

  final HomeRepository homeRepository;
  final SocketRepository socketRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetChatListRequested) {
      yield* _mapGetChatListRequestedToState();
    } else if (event is StatusChanged) {
      yield* _mapStatusChangedToState(event);
    } else if (event is MessageReceived) {
      yield* _mapMessageReceivedToState(event);
    } else if (event is ChatSeenReceived) {
      yield* _mapChatSeenReceivedToState(event);
    } else if (event is IsTypingReceived) {
      yield* _mapIsTypingReceivedToState(event);
    } else if (event is UpdateChatInfoRequested) {
      yield* _mapUpdateChatInfoRequestedToState(event);
    }
  }

  @override
  Future<void> close() async {
    homeRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await super.close();
  }

  Stream<HomeState> _mapGetChatListRequestedToState() async* {
    assert(homeRepository != null);
    yield state.copyWith(status: HomeStatus.loading);

    try {
      final chatsList = await homeRepository.getChatsList();
      final chats = chatsList.chats.toList();
      _listenOnHub();
      yield state.copyWith(status: HomeStatus.success, chats: chats);
    } on SocketException catch (_) {
      print('kir to netet');
      yield state.copyWith(status: HomeStatus.failure);
    } on Exception catch (_) {
      yield state.copyWith(status: HomeStatus.failure);
    }
  }

  void _listenOnHub() {
    assert(homeRepository != null && socketRepository != null);
    final hubConnection = socketRepository.hubConnection;
    homeRepository.listenOnStatusChanged(
      hubConnection: hubConnection,
      onStatusChanged: (onStatusChanged) => add(StatusChanged(onStatusChanged)),
    );
    homeRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) =>
          add(MessageReceived(chatMessageReceive)),
    );
    homeRepository.listenOnMessageSeen(
      hubConnection: hubConnection,
      onMessageSeen: (onMessageSeen) => add(ChatSeenReceived(onMessageSeen)),
    );
    homeRepository.listenOnChatIsTyping(
      hubConnection: hubConnection,
      onChatIsTyping: (onChatIsTyping) => add(IsTypingReceived(onChatIsTyping)),
    );
  }

  Stream<HomeState> _mapStatusChangedToState(StatusChanged event) async* {
    final chat = state.chats.singleWhere(
      (chat) => event.onStatusChanged.userId == chat.userId,
      orElse: () => null,
    );
    if (chat != null) {
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexWhere(
                  (chat) => event.onStatusChanged.userId == chat.userId)] =
              chat.rebuild(
            (b) => b
              ..isOnline = event.onStatusChanged.online
              ..lastSeen = DateTime.fromMillisecondsSinceEpoch(
                  event.onStatusChanged.lastSeen),
          ),
      );
    }
  }

  Stream<HomeState> _mapMessageReceivedToState(MessageReceived event) async* {
    final chat = state.chats.singleWhere(
      (chat) => event.onChatMessageReceived.senderId == chat.userId,
      orElse: () => null,
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
          ..[state.chats.indexWhere((chat) =>
                  event.onChatMessageReceived.senderId == chat.userId)] =
              chat.rebuild(
            (b) => b
              ..newMessagesCount += 1
              ..lastMessage = message.toBuilder(),
          ),
      );
    }
  }

  Stream<HomeState> _mapChatSeenReceivedToState(ChatSeenReceived event) async* {
    final chat = state.chats.firstWhere(
      (chat) => event.onMessageSeen.userId == chat.userId,
      orElse: () => null,
    );
    if (chat != null) {
      chat.rebuild((b) => b..lastMessage.seen = true);
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexWhere(
                  (chat) => event.onMessageSeen.userId == chat.userId)] =
              chat.rebuild(
            (b) => b..lastMessage.seen = true,
          ),
      );
    }
  }

  Stream<HomeState> _mapIsTypingReceivedToState(IsTypingReceived event) async* {
    final chat = state.chats.firstWhere(
      (chat) => event.onChatIsTyping.userId == chat.userId,
      orElse: () => null,
    );
    if (chat != null) {
      chat.rebuild((b) => b..isTyping = true);
      yield state.copyWith(chats: List.of(state.chats));
      yield state.copyWith(
        chats: List.of(state.chats)
          ..[state.chats.indexWhere(
                  (chat) => event.onChatIsTyping.userId == chat.userId)] =
              chat.rebuild(
            (b) => b..isTyping = event.onChatIsTyping.isTyping,
          ),
      );
    }
  }

  Stream<HomeState> _mapUpdateChatInfoRequestedToState(
      UpdateChatInfoRequested event) async* {
    yield state.copyWith(
      chats: List.of(state.chats)
        ..[state.chats.indexWhere(
                (chat) => chat.containerId == event.chatInfo.containerId)] =
            event.chatInfo,
    );
  }
}
