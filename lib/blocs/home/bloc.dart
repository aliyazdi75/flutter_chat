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
    } else if (event is UpdateChatInfoRequested) {
      yield* _mapUpdateChatInfoRequestedToState(event);
    }
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
    homeRepository.listenOnStatusChange(
      hubConnection: hubConnection,
      onStatusChange: (onStatusChange) async* {
        final chat = state.chats.firstWhere(
          (chat) => onStatusChange.userId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          chat.rebuild(
            (b) => b
              ..isOnline = onStatusChange.online
              ..lastSeen =
                  DateTime.fromMillisecondsSinceEpoch(onStatusChange.lastSeen),
          );
          yield state.copyWith(chats: List.of(state.chats));
        }
      },
    );
    homeRepository.listenOnChatTyping(
      hubConnection: hubConnection,
      onChatTyping: (onChatTyping) async* {
        final chat = state.chats.firstWhere(
          (chat) => onChatTyping.userId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          chat.rebuild((b) => b..isTyping = true);
          yield state.copyWith(chats: List.of(state.chats));
        }
      },
    );
    homeRepository.listenOnMessageSeen(
      hubConnection: hubConnection,
      onMessageSeen: (onMessageSeen) async* {
        final chat = state.chats.firstWhere(
          (chat) => onMessageSeen.userId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          chat.rebuild((b) => b..lastMessage.seen = true);
          yield state.copyWith(chats: List.of(state.chats));
        }
      },
    );
    homeRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) async* {
        final chat = state.chats.firstWhere(
          (chat) => chatMessageReceive.senderId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          final message = Message(
            (b) => b
              ..id = chatMessageReceive.id
              ..seen = false
              ..sentByMe = false
              ..isSent = true
              ..sentAt =
                  DateTime.fromMillisecondsSinceEpoch(chatMessageReceive.date)
              ..type = MessageType.text
              ..text = chatMessageReceive.text,
          );
          chat.rebuild(
            (b) => b
              ..newMessagesCount += 1
              ..lastMessage = message.toBuilder(),
          );
          yield state.copyWith(chats: List.of(state.chats));
        }
      },
    );
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
