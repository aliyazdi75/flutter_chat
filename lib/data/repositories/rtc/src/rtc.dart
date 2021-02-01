import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/providers/hub/rtc/index.dart';
import 'package:signalr_core/signalr_core.dart';

class RTCRepository {
  RTCRepository(this.hubConnection);

  final HubConnection hubConnection;

  void listenOn({
    @required Function(List<dynamic> arguments) messageReceived,
    @required Function(List<dynamic> arguments) webRTCHangup,
    @required Function(List<dynamic> arguments) webRTCOffer,
    @required Function(List<dynamic> arguments) webRTCAnswer,
    @required Function(List<dynamic> arguments) webRTCIceCandidate,
  }) {
    assert(hubConnection != null);
    RTCHub.listenOn(
      hubConnection,
      messageReceived,
      webRTCHangup,
      webRTCOffer,
      webRTCAnswer,
      webRTCIceCandidate,
    );
  }

  void listenOff() {
    assert(hubConnection != null);
    RTCHub.listenOff(hubConnection);
  }

  Future<dynamic> sendMessage(String userId, String message) async {
    assert(hubConnection != null);
    return await RTCHub.sendMessage(hubConnection, userId, message);
  }

  Future<dynamic> sendMessageAuthorize(String userId, String message) async {
    assert(hubConnection != null);
    return await RTCHub.sendMessageAuthorize(hubConnection, userId, message);
  }

  Future<dynamic> sendWebRTCHangup(String userId) async {
    assert(hubConnection != null);
    return await RTCHub.sendWebRTCHangup(hubConnection, userId);
  }

  Future<dynamic> sendWebRTCOffer(String userId, String sdp) async {
    assert(hubConnection != null);
    return await RTCHub.sendWebRTCOffer(hubConnection, userId, sdp);
  }

  Future<dynamic> sendWebRTCAnswer(String userId, String sdp) async {
    assert(hubConnection != null);
    return await RTCHub.sendWebRTCAnswer(hubConnection, userId, sdp);
  }

  Future<dynamic> sendWebRTCIceCandidate(String userId, String ice) async {
    assert(hubConnection != null);
    return await RTCHub.sendWebRTCIceCandidate(hubConnection, userId, ice);
  }
}
