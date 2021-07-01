import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/providers/hub/web_rtc/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';

class CallRepository {
  CallRepository() : webRTCHub = WebRTCHub();

  final WebRTCHub webRTCHub;

  String? userId;
  WebRTCOffer? webRTCOffer;
  List<RTCIceCandidate> iceCandidates = [];

  void listenOnWebRTCIceCandidateReceived({
    required HubConnection hubConnection,
  }) {
    webRTCHub.listenOnWebRTCIceCandidateReceived(hubConnection, _addCandidate);
  }

  void _addCandidate(WebRTCIceCandidate webRTCIceCandidate) {
    userId ??= webRTCIceCandidate.userId;
    if (userId == webRTCIceCandidate.userId) {
      final candidate = RTCIceCandidate(
        webRTCIceCandidate.candidate,
        webRTCIceCandidate.sdpMid,
        webRTCIceCandidate.sdpMLineIndex,
      );
      iceCandidates.add(candidate);
    }
  }

  void listenOnWebRTCOfferReceived({
    required HubConnection hubConnection,
    required Function(WebRTCOffer webRTCOffer) onWebRTCOfferReceived,
  }) {
    final Function(WebRTCOffer webRTCOffer) onWebRTCOffer = (webRTCOffer) {
      userId ??= webRTCOffer.userId;
      onWebRTCOfferReceived(webRTCOffer);
    };
    webRTCHub.listenOnWebRTCOfferReceived(hubConnection, onWebRTCOffer);
  }

  void listenOnWebRTCHangUpReceived({
    required HubConnection hubConnection,
    required Function(WebRTCHangUp webRTCHangUp) onWebRTCHangUpReceived,
  }) {
    webRTCHub.listenOnWebRTCHangUpReceived(
        hubConnection, onWebRTCHangUpReceived);
  }

  Future<void> hangUp({
    required HubConnection hubConnection,
    required WebRTCHangUp webRTCHangUp,
  }) async {
    await _sendWebRTCHangUp(hubConnection, webRTCHangUp.userId);
  }

  void resetCallRepository() {
    userId = null;
    webRTCOffer = null;
    iceCandidates = [];
  }

  Future<void> reject({
    required HubConnection hubConnection,
    required WebRTCReject webRTCReject,
  }) async {
    await WebRTCHub.sendWebRTCReject(hubConnection, webRTCReject.userId);
  }

  Future<void> _sendWebRTCHangUp(
      HubConnection hubConnection, String userId) async {
    await WebRTCHub.sendWebRTCHangUp(hubConnection, userId);
  }

  void listenOff({required HubConnection hubConnection}) {
    webRTCHub.listenOff(hubConnection);
  }
}
