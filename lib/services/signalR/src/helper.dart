import 'package:flutter_chat/data/constants/index.dart';
import 'package:signalr_core/signalr_core.dart';

import 'exception.dart';

export 'package:signalr_core/signalr_core.dart';

typedef SocketResponseCallBack = void Function(Map<String, dynamic> response);

abstract class SignalRBase {
  Future<HubConnection> startConnection(
    String token, {
    Function onReconnecting,
    Function onReconnected,
  });

  Future<void> stopConnection();

  void on(String methodName, SocketResponseCallBack responseCallBack);

  void off(String methodName, {SocketResponseCallBack responseCallBack});

  Future<Map<String, dynamic>> invoke(String methodName, {List<dynamic> args});
}

class SignalRHelper implements SignalRBase {
  SignalRHelper({this.hubConnection});

  final HubConnection hubConnection;

  @override
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

  @override
  Future<void> stopConnection() async {
    assert(hubConnection != null);
    await hubConnection.stop();
  }

  @override
  void on(
    String methodName,
    SocketResponseCallBack responseCallBack,
  ) {
    assert(hubConnection != null);
    hubConnection.on(
        methodName, _functionConvert(methodName, responseCallBack));
  }

  @override
  void off(
    String methodName, {
    SocketResponseCallBack responseCallBack,
  }) {
    assert(hubConnection != null);
    hubConnection.on(
        methodName, _functionConvert(methodName, responseCallBack));
  }

  @override
  Future<Map<String, dynamic>> invoke(String methodName,
      {List<dynamic> args}) async {
    assert(hubConnection != null);
    try {
      return await hubConnection.invoke(methodName, args: args)
          as Map<String, dynamic>;
    } on FormatException {
      throw SocketResponseException(methodName);
    }
  }

  MethodInvacationFunc _functionConvert(
      String methodName, SocketResponseCallBack responseCallBack) {
    return (arguments) {
      try {
        if (arguments.isEmpty) {
          throw SocketEmptyResponseException(methodName);
        }
        final response = arguments.first as Map<String, dynamic>;
        responseCallBack(response);
      } on FormatException {
        throw SocketResponseException(methodName);
      }
    };
  }
}
