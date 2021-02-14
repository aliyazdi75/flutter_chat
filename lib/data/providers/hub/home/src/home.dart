import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';
import 'package:signalr_core/signalr_core.dart';

class HubMethod {
  HubMethod(this.methodName, this.methodFunction);

  final String methodName;
  final Function(List<dynamic> arguments) methodFunction;
}

class HomeHub {
  static HomeHub _instance;
  List<HubMethod> _hubMethodListenOnList;

  factory HomeHub() {
    _instance ??= HomeHub._();
    return _instance;
  }

  HomeHub._() {
    _hubMethodListenOnList = <HubMethod>[];
  }

  void listenOnStatusChanged(
    HubConnection hubConnection,
    Function(ChatStatusChange chatStatusChange) onStatusChanged,
  ) {
    final chatStatusChange = (List<dynamic> arguments) => onStatusChanged(
        ChatStatusChange.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatUserStatusChangeMethodName,
      chatStatusChange,
    );
    _hubMethodListenOnList
        .add(HubMethod(chatUserStatusChangeMethodName, chatStatusChange));
  }

  void listenOnMessageReceived(
    HubConnection hubConnection,
    Function(ChatMessageReceive chatMessageReceive) onMessageReceived,
  ) {
    final chatMessageReceived = (List<dynamic> arguments) => onMessageReceived(
        ChatMessageReceive.fromJson(arguments.first as Map<String, dynamic>));
    SignalRHelper(hubConnection: hubConnection).on(
      chatMessageMethodName,
      chatMessageReceived,
    );
    _hubMethodListenOnList
        .add(HubMethod(chatMessageMethodName, chatMessageReceived));
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

  void listenOnChatIsTyping(
    HubConnection hubConnection,
    Function(ChatIsTyping chatIsTyping) onChatIsTyping,
  ) {
    final chatTyping = (List<dynamic> arguments) => onChatIsTyping(
        ChatIsTyping.fromJson(arguments.first as Map<String, dynamic>));
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
}
