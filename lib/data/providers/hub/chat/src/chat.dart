import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';

class _HubMethod {
  _HubMethod(this.methodName, this.methodFunction);

  final String methodName;
  final SocketResponseCallBack methodFunction;
}

class ChatHub {
  List<_HubMethod> _hubMethodListenOnList = <_HubMethod>[];

  void listenOnStatusChanged(
    HubConnection hubConnection,
    Function(ChatStatusChange chatStatusChange) onStatusChanged,
  ) {
    final SocketResponseCallBack chatStatusChange =
        (response) => onStatusChanged(ChatStatusChange.fromJson(response));
    final hubMethod =
        _HubMethod(chatUserStatusChangeMethodName, chatStatusChange);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      chatUserStatusChangeMethodName,
      chatStatusChange,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnMessageReceived(
    HubConnection hubConnection,
    Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  ) {
    final SocketResponseCallBack chatMessageReceived =
        (response) => onMessageReceived(ChatMessageReceive.fromJson(response));
    final hubMethod = _HubMethod(chatMessageMethodName, chatMessageReceived);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      chatMessageMethodName,
      chatMessageReceived,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnChatSeen(
    HubConnection hubConnection,
    Function(ChatSeen chatSeen) onChatSeen,
  ) {
    final SocketResponseCallBack chatMessageSeen =
        (response) => onChatSeen(ChatSeen.fromJson(response));
    final hubMethod = _HubMethod(chatSeenMethodName, chatMessageSeen);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      chatSeenMethodName,
      chatMessageSeen,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnChatIsTyping(
    HubConnection hubConnection,
    Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  ) {
    final SocketResponseCallBack chatIsTyping =
        (response) => onChatIsTyping(ChatIsTyping.fromJson(response));
    final hubMethod = _HubMethod(chatTypingMethodName, chatIsTyping);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      chatTypingMethodName,
      chatIsTyping,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOff(HubConnection hubConnection) {
    _hubMethodListenOnList.forEach(
      (hubMethod) => SignalRHelper(hubConnection: hubConnection).off(
        hubMethod.methodName,
        responseCallBack: hubMethod.methodFunction,
      ),
    );
    _hubMethodListenOnList = const <_HubMethod>[];
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
