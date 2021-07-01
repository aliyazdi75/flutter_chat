import 'dart:async';

import 'package:flutter_chat/data/providers/hub/socket/index.dart';
import 'package:signalr_core/signalr_core.dart';

class SocketRepository {
  HubConnection? _hubConnection;

  HubConnection get hubConnection {
    assert(_hubConnection != null,
        'First use `connect` method to initial connection!');
    return _hubConnection!;
  }

  Future<void> connect({
    required String token,
    Function? onReconnecting,
    Function? onReconnected,
  }) async {
    _hubConnection ??= await SocketHub.connect(
      token,
      onReconnecting: onReconnecting,
      onReconnected: onReconnected,
    );
  }

  Future<void> disconnect() async {
    assert(_hubConnection != null,
        'First use `connect` method to initial connection!');
    await SocketHub.disconnect(_hubConnection!);
  }
}
