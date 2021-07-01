import 'package:flutter_chat/services/signalR/index.dart';
import 'package:signalr_core/signalr_core.dart';

class SocketHub {
  static Future<HubConnection> connect(
    String token, {
    Function? onReconnecting,
    Function? onReconnected,
  }) async {
    return await SignalRHelper().startConnection(
      token,
      onReconnecting: onReconnecting,
      onReconnected: onReconnected,
    );
  }

  static Future<void> disconnect(HubConnection hubConnection) async {
    return await SignalRHelper(hubConnection: hubConnection).stopConnection();
  }
}
