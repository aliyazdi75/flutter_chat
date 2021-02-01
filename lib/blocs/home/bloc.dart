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
    @required this.homeRepository,
    @required this.socketRepository,
  })  : assert(homeRepository != null),
        assert(socketRepository != null),
        super(const HomeState._());

  final HomeRepository homeRepository;
  final SocketRepository socketRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetChatListRequested) {
      yield* _mapGetChatListRequestedToState();
    }
  }

  Stream<HomeState> _mapGetChatListRequestedToState() async* {
    yield const HomeState.loading();

    try {
      final chatsList = await homeRepository.getChatsList();
      final chats = chatsList.chats.toList();
      _listenOnHub();
      yield HomeState.success(chats);
    } on SocketException catch (_) {
      print('kir to netet');
      yield const HomeState.failure();
    } on Exception catch (_) {
      yield const HomeState.failure();
    }
  }

  void _listenOnHub() {
    final hubConnection = socketRepository.hubConnection;
    homeRepository.listenOnStatusChange(
      hubConnection: hubConnection,
      onStatusChange: (onStatusChange) {
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
        }
      },
    );
    homeRepository.listenOnChatTyping(
      hubConnection: hubConnection,
      onChatTyping: (onChatTyping) {
        final chat = state.chats.firstWhere(
          (chat) => onChatTyping.userId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          chat.rebuild((b) => b..isTyping = true);
        }
      },
    );
    homeRepository.listenOnMessageSeen(
      hubConnection: hubConnection,
      onMessageSeen: (onMessageSeen) {
        final chat = state.chats.firstWhere(
          (chat) => onMessageSeen.userId == chat.userId,
          orElse: () => null,
        );
        if (chat != null) {
          chat.rebuild((b) => b..lastMessage.seen = true);
        }
      },
    );
    homeRepository.listenOnMessageReceived(
      hubConnection: hubConnection,
      onMessageReceived: (chatMessageReceive) {
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
        }
      },
    );
  }
}
