import 'package:flutter_chat/services/signalR/index.dart';
import 'package:signalr_core/signalr_core.dart';

class RTCHub {
  static void listenOn(
    HubConnection hubConnection,
    Function(List<dynamic> arguments) messageReceived,
    Function(List<dynamic> arguments) webRTCHangup,
    Function(List<dynamic> arguments) webRTCOffer,
    Function(List<dynamic> arguments) webRTCAnswer,
    Function(List<dynamic> arguments) webRTCIceCandidate,
  ) {
    SignalRHelper(hubConnection: hubConnection).on(
      'ReceiveMessage',
      messageReceived,
    );
    SignalRHelper(hubConnection: hubConnection).on(
      'ReceiveWebRTCHangUp',
      webRTCHangup,
    );
    SignalRHelper(hubConnection: hubConnection).on(
      'ReceiveWebRTCOffer',
      webRTCOffer,
    );
    SignalRHelper(hubConnection: hubConnection).on(
      'ReceiveWebRTCAnswer',
      webRTCAnswer,
    );
    SignalRHelper(hubConnection: hubConnection).on(
      'ReceiveWebRTCIceCandidate',
      webRTCIceCandidate,
    );
  }

  static void listenOff(HubConnection hubConnection) {
    SignalRHelper(hubConnection: hubConnection).off('ReceiveWebRTCHangUp');
    SignalRHelper(hubConnection: hubConnection).off('ReceiveWebRTCOffer');
    SignalRHelper(hubConnection: hubConnection).off('ReceiveWebRTCAnswer');
    SignalRHelper(hubConnection: hubConnection)
        .off('ReceiveWebRTCIceCandidate');
  }

  static Future<dynamic> sendMessage(
    HubConnection hubConnection,
    String userId,
    String message,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'SendMessage',
      args: <dynamic>[userId, message],
    );
  }

  static Future<dynamic> sendMessageAuthorize(
    HubConnection hubConnection,
    String userId,
    String message,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'SendMessageAuthorize',
      args: <dynamic>[userId, message],
    );
  }

  static Future<dynamic> sendWebRTCHangup(
    HubConnection hubConnection,
    String userId,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'WebRTCHangUp',
      args: <dynamic>[userId],
    );
  }

  static Future<dynamic> sendWebRTCOffer(
    HubConnection hubConnection,
    String userId,
    String sdp,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'WebRTCOffer',
      args: <dynamic>[userId, sdp],
    );
  }

  static Future<dynamic> sendWebRTCAnswer(
    HubConnection hubConnection,
    String userId,
    String sdp,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'WebRTCAnswer',
      args: <dynamic>[userId, sdp],
    );
  }

  static Future<dynamic> sendWebRTCIceCandidate(
    HubConnection hubConnection,
    String userId,
    String ice,
  ) async {
    return await SignalRHelper(hubConnection: hubConnection).invoke(
      'WebRTCIceCandidate',
      args: <dynamic>[userId, ice],
    );
  }
}
