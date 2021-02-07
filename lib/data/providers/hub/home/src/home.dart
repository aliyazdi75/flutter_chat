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
}
