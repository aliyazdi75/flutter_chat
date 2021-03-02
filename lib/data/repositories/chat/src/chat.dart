import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/providers/api/chat/index.dart';
import 'package:flutter_chat/data/providers/hub/chat/index.dart';
import 'package:signalr_core/signalr_core.dart';

class ChatRepository {
  ChatRepository() : chatHub = ChatHub();

  final ChatHub chatHub;

  Future<Chat> openChat({String userId, int containerId}) async {
    assert(userId != null || containerId != null);
    final body = OpenChatInputBody(
      (b) => b
        ..userId = userId
        ..containerId = containerId,
    );
    return await ChatApi.openChat(body);
  }

  Future<GetMessageResponse> getMessages({
    @required String userId,
    int minId,
    int maxId,
    int count,
  }) async {
    assert(userId != null);
    final query = GetMessagesInputQuery(
      (b) => b
        ..minId = minId
        ..maxId = maxId
        ..count = count,
    );
    return await ChatApi.getMessages(userId, query);
  }

  Future<void> readChat({@required int containerId, bool read = true}) async {
    assert(containerId != null);
    final body = ChatReadInputBody(
      (b) => b
        ..containerId = containerId
        ..read = read,
    );
    return await ChatApi.readChat(body);
  }

  Future<void> closeChat({String userId, int containerId}) async {
    assert(userId != null || containerId != null);
    final body = CloseChatInputBody(
      (b) => b
        ..userId = userId
        ..containerId = containerId,
    );
    return await ChatApi.closeChat(body);
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

  Future<SocketChatMessageReceive> sendChatMessage({
    @required HubConnection hubConnection,
    @required String userId,
    @required String message,
  }) async {
    assert(hubConnection != null);
    return await ChatHub.sendChatMessage(hubConnection, userId, message);
  }

  Future<void> sendUserIsTyping({
    @required HubConnection hubConnection,
    @required String userId,
  }) async {
    assert(hubConnection != null);
    await ChatHub.sendUserIsTyping(hubConnection, userId);
  }

  Future<void> sendUserChatSeen({
    @required HubConnection hubConnection,
    @required String userId,
    @required int lastMessageId,
  }) async {
    assert(hubConnection != null);
    await ChatHub.sendUserChatSeen(hubConnection, userId, lastMessageId);
  }
}
