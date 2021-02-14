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

  void listenOnStatusChanged({
    @required HubConnection hubConnection,
    @required Function(ChatStatusChange chatStatusChange) onStatusChanged,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnStatusChanged(hubConnection, onStatusChanged);
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

  void listenOnChatIsTyping({
    @required HubConnection hubConnection,
    @required Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  }) {
    assert(hubConnection != null);
    HomeHub().listenOnChatIsTyping(hubConnection, onChatIsTyping);
  }

  void listenOff({@required HubConnection hubConnection}) {
    assert(hubConnection != null);
    HomeHub().listenOff(hubConnection);
  }
}
