import 'package:flutter_chat/data/constants/index.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRHelper {
  SignalRHelper({this.hubConnection});

  final HubConnection hubConnection;

  Future<HubConnection> startConnection(
    String token, {
    Function onReconnecting,
    Function onReconnected,
  }) async {
    final queryParams = {signalRAuthQuery: token};
    final hubConnection = HubConnectionBuilder()
        .withUrl(
          usingSSL
              ? Uri.https(
                  serverUrl,
                  '/hub/',
                  queryParams,
                ).toString()
              : Uri.http(
                  serverUrl,
                  '/hub/',
                  queryParams,
                ).toString(),
          HttpConnectionOptions(
              // accessTokenFactory: () async => token,
              // logging: (level, message) => print(message),
              ),
        )
        .withAutomaticReconnect()
        .build()
          ..onreconnecting((exception) => onReconnecting())
          ..onreconnected((connectionId) => onReconnected());

    await hubConnection.start();
    return hubConnection;
  }

  Future<void> stopConnection() async {
    assert(hubConnection != null);
    await hubConnection.stop();
  }

  void on(
    String methodName,
    Function(List<dynamic> arguments) methodFunction,
  ) {
    assert(hubConnection != null);
    hubConnection.on(methodName, methodFunction);
  }

  void off(
    String methodName, {
    Function(List<dynamic> arguments) methodFunction,
  }) {
    assert(hubConnection != null);
    hubConnection.off(methodName, method: methodFunction);
  }

  Future<Map<String, dynamic>> invoke(String methodName,
      {List<dynamic> args}) async {
    assert(hubConnection != null);
    return await hubConnection.invoke(methodName, args: args)
        as Map<String, dynamic>;
  }
}
