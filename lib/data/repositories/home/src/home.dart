import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/providers/api/home/index.dart';
import 'package:flutter_chat/data/providers/hub/chat/index.dart';
import 'package:signalr_core/signalr_core.dart';

class HomeRepository {
  HomeRepository() : chatHub = ChatHub();

  final ChatHub chatHub;
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
    chatHub.listenOnStatusChanged(hubConnection, onStatusChanged);
  }

  void listenOnMessageReceived({
    @required HubConnection hubConnection,
    @required Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  }) {
    assert(hubConnection != null);
    chatHub.listenOnMessageReceived(hubConnection, onMessageReceived);
  }

  void listenOnChatSeen({
    @required HubConnection hubConnection,
    @required Function(ChatSeen chatSeen) onChatSeen,
  }) {
    assert(hubConnection != null);
    chatHub.listenOnChatSeen(hubConnection, onChatSeen);
  }

  void listenOnChatIsTyping({
    @required HubConnection hubConnection,
    @required Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  }) {
    assert(hubConnection != null);
    chatHub.listenOnChatIsTyping(hubConnection, onChatIsTyping);
  }

  void listenOff({@required HubConnection hubConnection}) {
    assert(hubConnection != null);
    chatHub.listenOff(hubConnection);
  }
}
