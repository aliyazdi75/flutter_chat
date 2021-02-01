import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/providers/api/chat/index.dart';
import 'package:flutter_chat/data/providers/hub/chat/index.dart';
import 'package:signalr_core/signalr_core.dart';

class ChatRepository {
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

  void listenOnStatusChange({
    @required HubConnection hubConnection,
    @required Function(ChatStatusChange chatStatusChange) onStatusChange,
  }) {
    assert(hubConnection != null);
    ChatHub().listenOnStatusChange(hubConnection, onStatusChange);
  }

  void listenOnMessageReceived({
    @required HubConnection hubConnection,
    @required Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  }) {
    assert(hubConnection != null);
    ChatHub().listenOnMessageReceived(hubConnection, onMessageReceived);
  }

  void listenOnMessageSeen({
    @required HubConnection hubConnection,
    @required Function(ChatSeen chatSeen) onMessageSeen,
  }) {
    assert(hubConnection != null);
    ChatHub().listenOnMessageSeen(hubConnection, onMessageSeen);
  }

  void listenOnChatTyping({
    @required HubConnection hubConnection,
    @required Function(ChatTyping chatTyping) onChatTyping,
  }) {
    assert(hubConnection != null);
    ChatHub().listenOnChatTyping(hubConnection, onChatTyping);
  }

  void listenOff({@required HubConnection hubConnection}) {
    assert(hubConnection != null);
    ChatHub().listenOff(hubConnection);
  }

  Future<int> sendChatMessage({
    @required HubConnection hubConnection,
    @required String userId,
    @required String message,
  }) async {
    assert(hubConnection != null);
    return await ChatHub.sendChatMessage(hubConnection, userId, message);
  }

  Future<int> sendUserIsTyping({
    @required HubConnection hubConnection,
    @required String userId,
  }) async {
    assert(hubConnection != null);
    return await ChatHub.sendUserIsTyping(hubConnection, userId);
  }

  Future<int> sendUserChatSeen({
    @required HubConnection hubConnection,
    @required String userId,
    @required int lastMessageId,
  }) async {
    assert(hubConnection != null);
    return await ChatHub.sendUserChatSeen(hubConnection, userId, lastMessageId);
  }
}
