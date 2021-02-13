import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';
import 'package:signalr_core/signalr_core.dart';

class HubMethod {
  HubMethod(this.methodName, this.methodFunction);

  final String methodName;
  final Function(List<dynamic> arguments) methodFunction;
}

class ChatHub {
  static ChatHub _instance;
  List<HubMethod> _hubMethodListenOnList;

  factory ChatHub() {
    _instance ??= ChatHub._();
    return _instance;
  }

  ChatHub._() {
    _hubMethodListenOnList = <HubMethod>[];
  }

  void listenOnStatusChange(
    HubConnection hubConnection,
    Function(ChatStatusChange chatStatusChange) onStatusChange,
  ) {
    final chatStatusChange = (List<dynamic> arguments) => onStatusChange(
        ChatStatusChange.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatMessageMethodName,
      chatStatusChange,
    );
    _hubMethodListenOnList
        .add(HubMethod(chatMessageMethodName, chatStatusChange));
  }

  void listenOnMessageReceived(
    HubConnection hubConnection,
    Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  ) {
    final chatMessageReceived = (List<dynamic> arguments) => onMessageReceived(
        ChatMessageReceive.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatUserStatusChangeMethodName,
      chatMessageReceived,
    );
    _hubMethodListenOnList
        .add(HubMethod(chatUserStatusChangeMethodName, chatMessageReceived));
  }

  void listenOnMessageSeen(
    HubConnection hubConnection,
    Function(ChatSeen chatSeen) onMessageSeen,
  ) {
    final chatMessageSeen = (List<dynamic> arguments) => onMessageSeen(
        ChatSeen.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatSeenMethodName,
      chatMessageSeen,
    );
    _hubMethodListenOnList.add(HubMethod(chatSeenMethodName, chatMessageSeen));
  }

  void listenOnChatTyping(
    HubConnection hubConnection,
    Function(ChatTyping chatTyping) onChatTyping,
  ) {
    final chatTyping = (List<dynamic> arguments) => onChatTyping(
        ChatTyping.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatTypingMethodName,
      chatTyping,
    );
    _hubMethodListenOnList.add(HubMethod(chatTypingMethodName, chatTyping));
  }

  void listenOff(HubConnection hubConnection) {
    _hubMethodListenOnList.forEach(
      (hubMethod) => SignalRHelper(hubConnection: hubConnection).off(
        hubMethod.methodName,
        methodFunction: hubMethod.methodFunction,
      ),
    );
    _hubMethodListenOnList = const <HubMethod>[];
  }

  static Future<SocketChatMessageReceive> sendChatMessage(
    HubConnection hubConnection,
    String userId,
    String message,
  ) async {
    final chatMessageReceived =
        await SignalRHelper(hubConnection: hubConnection).invoke(
      sendChatTextMethodName,
      args: <dynamic>[userId, message],
    );
    return SocketChatMessageReceive.fromJson(chatMessageReceived);
  }

  static Future<void> sendUserIsTyping(
    HubConnection hubConnection,
    String userId,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      sendChatTypingMethodName,
      args: <dynamic>[userId],
    );
  }

  static Future<void> sendUserChatSeen(
    HubConnection hubConnection,
    String userId,
    int lastMessageId,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      sendChatSeenMethodName,
      args: <dynamic>[userId, lastMessageId],
    );
  }
}
