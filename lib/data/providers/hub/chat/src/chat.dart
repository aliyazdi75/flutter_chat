import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';

class ChatHub {
  List<HubMethod> listenOnHubMethod = <HubMethod>[];

  void listenOnStatusChanged(
    HubConnection hubConnection,
    Function(ChatStatusChange chatStatusChange) onStatusChanged,
  ) {
    final SocketResponseCallBack chatStatusChange =
        (response) => onStatusChanged(ChatStatusChange.fromJson(response));
    final hubMethod = HubMethod(
        chatUserStatusChangeMethodName,
        SignalRHelper.toSocketFunction(
            chatUserStatusChangeMethodName, chatStatusChange));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnMessageReceived(
    HubConnection hubConnection,
    Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  ) {
    final SocketResponseCallBack chatMessageReceived =
        (response) => onMessageReceived(ChatMessageReceive.fromJson(response));
    final hubMethod = HubMethod(
        chatMessageMethodName,
        SignalRHelper.toSocketFunction(
            chatMessageMethodName, chatMessageReceived));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnChatSeen(
    HubConnection hubConnection,
    Function(ChatSeen chatSeen) onChatSeen,
  ) {
    final SocketResponseCallBack chatMessageSeen =
        (response) => onChatSeen(ChatSeen.fromJson(response));
    final hubMethod = HubMethod(chatSeenMethodName,
        SignalRHelper.toSocketFunction(chatSeenMethodName, chatMessageSeen));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnChatIsTyping(
    HubConnection hubConnection,
    Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  ) {
    final SocketResponseCallBack chatIsTyping =
        (response) => onChatIsTyping(ChatIsTyping.fromJson(response));
    final hubMethod = HubMethod(chatTypingMethodName,
        SignalRHelper.toSocketFunction(chatTypingMethodName, chatIsTyping));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOff(HubConnection hubConnection) {
    listenOnHubMethod.forEach(
      (hubMethod) => SignalRHelper(hubConnection: hubConnection).off(
        hubMethod.methodName,
        responseCallBack: hubMethod.methodFunction,
      ),
    );
    listenOnHubMethod = const <HubMethod>[];
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
