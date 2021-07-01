import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/providers/api/home/index.dart';
import 'package:flutter_chat/data/providers/hub/chat/index.dart';
import 'package:signalr_core/signalr_core.dart';

class HomeRepository {
  HomeRepository() : chatHub = ChatHub();

  final ChatHub chatHub;
  ChatList? _chatsList;

  Future<ChatList> getChatsList({bool update = false}) async {
    if (_chatsList == null || update) {
      final chatsList = await HomeApi.getChatList();
      _chatsList = chatsList;
    }
    return _chatsList!;
  }

  void listenOnStatusChanged({
    required HubConnection hubConnection,
    required Function(ChatStatusChange chatStatusChange) onStatusChanged,
  }) {
    chatHub.listenOnStatusChanged(hubConnection, onStatusChanged);
  }

  void listenOnMessageReceived({
    required HubConnection hubConnection,
    required Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  }) {
    chatHub.listenOnMessageReceived(hubConnection, onMessageReceived);
  }

  void listenOnChatSeen({
    required HubConnection hubConnection,
    required Function(ChatSeen chatSeen) onChatSeen,
  }) {
    chatHub.listenOnChatSeen(hubConnection, onChatSeen);
  }

  void listenOnChatIsTyping({
    required HubConnection hubConnection,
    required Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  }) {
    chatHub.listenOnChatIsTyping(hubConnection, onChatIsTyping);
  }

  void listenOff({required HubConnection hubConnection}) {
    chatHub.listenOff(hubConnection);
  }
}
