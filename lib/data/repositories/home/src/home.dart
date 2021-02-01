import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/providers/api/home/index.dart';
import 'package:flutter_chat/data/providers/hub/home/index.dart';
import 'package:signalr_core/signalr_core.dart';

class HomeRepository {
  ChatList _chatsList;

  Future<ChatList> getChatsList({bool update = false}) async {
    if (_chatsList == null || update) {
      final chatsList = await HomeApi.getChatList();
      _chatsList = chatsList;
    }
    return _chatsList;
  }

  void listenOnStatusChange({
    @required HubConnection hubConnection,
    @required Function(ChatStatusChange chatStatusChange) onStatusChange,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnStatusChange(hubConnection, onStatusChange);
  }

  void listenOnMessageReceived({
    @required HubConnection hubConnection,
    @required Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnMessageReceived(hubConnection, onMessageReceived);
  }

  void listenOnMessageSeen({
    @required HubConnection hubConnection,
    @required Function(ChatSeen chatSeen) onMessageSeen,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnMessageSeen(hubConnection, onMessageSeen);
  }

  void listenOnChatTyping({
    @required HubConnection hubConnection,
    @required Function(ChatTyping chatTyping) onChatTyping,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnChatTyping(hubConnection, onChatTyping);
  }

  void listenOff({@required HubConnection hubConnection}) {
    assert(hubConnection != null);
    HomeHub().listenOff(hubConnection);
  }
}
