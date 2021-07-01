import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/providers/hub/web_rtc/index.dart';
import 'package:flutter_chat/data/providers/web_rtc/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';

class WebRTCRepository {
  WebRTCRepository() : webRTCHub = WebRTCHub();

  final WebRTCHub webRTCHub;

  RTCPeerConnection? _peerConnection;

  Future<RTCVideoRenderer> activateVideoRender() async {
    return await WebRTCProvider.activateVideoRender();
  }

  Future<bool> hasTorch({required MediaStream mediaStream}) async {
    return await WebRTCProvider.hasTorch(mediaStream);
  }

  Future<bool> toggleTorch(
      {required MediaStream mediaStream, required bool torchStatus}) async {
    return await WebRTCProvider.toggleTorch(mediaStream, torchStatus);
  }

  Future<bool> switchCamera({required MediaStream mediaStream}) async {
    return await WebRTCProvider.switchCamera(mediaStream);
  }

  bool toggleCameraActivation(
      {required MediaStream mediaStream,
      required bool cameraActivationStatus}) {
    return WebRTCProvider.toggleCameraActivation(
        mediaStream, cameraActivationStatus);
  }

  bool toggleMicActivation(
      {required MediaStream mediaStream, required bool micActivationStatus}) {
    return WebRTCProvider.toggleMicActivation(mediaStream, micActivationStatus);
  }

  Future<void> requestCall({
    required HubConnection hubConnection,
    required String userId,
    required Function(MediaStream stream) onLocalVideoRenderActivated,
    required Function(MediaStream stream) onRemoteVideoRenderActivated,
    required Function(MediaStream stream) onRemoteVideoRenderDeactivated,
    required Function(WebRTCHangUp webRTCHangUp) onWebRTCHangUpReceived,
    required Function(WebRTCReject webRTCReject) onWebRTCRejectReceived,
  }) async {
    //Initial Media Streams
    final localMediaStream = await _getUserMediaStream();
    onLocalVideoRenderActivated(localMediaStream);

    //Create peer connection and send candidate
    _peerConnection ??= await WebRTCProvider.createPeerConnectionStream(
      localMediaStream,
      onIceCandidate: (candidate) async {
        await _sendWebRTCIceCandidate(hubConnection, userId, candidate);
      },
      onIceConnectionState: (state) {
        // todo
        // RTCIceConnectionState.RTCIceConnectionStateChecking
        // RTCIceConnectionState.RTCIceConnectionStateConnected
        print('iceeeeeeeeeee' + state.toString());
      },
      onAddStream: onRemoteVideoRenderActivated,
      onRemoveStream: onRemoteVideoRenderDeactivated,
    );

    //Listen on Hubs
    webRTCHub.listenOnWebRTCAnswerReceived(
        hubConnection, _setRemoteAnswerDescription);
    webRTCHub.listenOnWebRTCIceCandidateReceived(hubConnection, _addCandidate);
    webRTCHub.listenOnWebRTCHangUpReceived(
        hubConnection, onWebRTCHangUpReceived);
    webRTCHub.listenOnWebRTCRejectReceived(
        hubConnection, onWebRTCRejectReceived);

    //Create an Offer and send
    final description = await WebRTCProvider.createOffer(_peerConnection!);
    await _peerConnection!.setLocalDescription(description);
    await _sendWebRTCOffer(hubConnection, userId, description);
  }

  Future<void> answerCall({
    required HubConnection hubConnection,
    required WebRTCOffer webRTCOffer,
    required List<RTCIceCandidate> iceCandidates,
    required Function(MediaStream stream) onLocalVideoRenderActivated,
    required Function(MediaStream stream) onRemoteVideoRenderActivated,
    required Function(MediaStream stream) onRemoteVideoRenderDeactivated,
    required Function(WebRTCHangUp webRTCHangUp) onWebRTCHangUpReceived,
  }) async {
    //Initial Media Streams
    final localMediaStream = await _getUserMediaStream();
    onLocalVideoRenderActivated(localMediaStream);

    //Create peer connection and send candidate
    _peerConnection ??= await WebRTCProvider.createPeerConnectionStream(
      localMediaStream,
      onIceCandidate: (candidate) async {
        await _sendWebRTCIceCandidate(
            hubConnection, webRTCOffer.userId, candidate);
      },
      onIceConnectionState: (state) {
        // todo
        print('iceeeeeeeeeee' + state.toString());
      },
      onAddStream: onRemoteVideoRenderActivated,
      onRemoveStream: onRemoteVideoRenderDeactivated,
    );

    //Add Ex-Candidates
    iceCandidates.forEach(
        (candidate) async => await _peerConnection!.addCandidate(candidate));

    //Listen on Hubs
    webRTCHub.listenOnWebRTCIceCandidateReceived(hubConnection, _addCandidate);
    webRTCHub.listenOnWebRTCHangUpReceived(
        hubConnection, onWebRTCHangUpReceived);

    //Set Remote Description
    await _setRemoteOfferDescription(webRTCOffer);

    //Create An Answer and send
    final description = await WebRTCProvider.createAnswer(_peerConnection!);
    await _peerConnection!.setLocalDescription(description);
    await _sendWebRTCAnswer(hubConnection, webRTCOffer.userId, description);
  }

  Future<void> _addCandidate(WebRTCIceCandidate webRTCIceCandidate) async {
    assert(_peerConnection != null);
    final candidate = RTCIceCandidate(
      webRTCIceCandidate.candidate,
      webRTCIceCandidate.sdpMid,
      webRTCIceCandidate.sdpMLineIndex,
    );
    await _peerConnection!.addCandidate(candidate);
  }

  Future<void> _setRemoteOfferDescription(WebRTCOffer webRTCOffer) async {
    assert(_peerConnection != null);

    final description =
        RTCSessionDescription(webRTCOffer.sdp, webRTCOffer.type.toString());
    await _peerConnection!.setRemoteDescription(description);
  }

  Future<void> _setRemoteAnswerDescription(WebRTCAnswer webRTCAnswer) async {
    assert(_peerConnection != null);

    final description =
        RTCSessionDescription(webRTCAnswer.sdp, webRTCAnswer.type.toString());
    await _peerConnection!.setRemoteDescription(description);
  }

  Future<MediaStream> _getUserMediaStream() async {
    return await WebRTCProvider.getUserMediaStream();
  }

  Future<void> hangUp({
    required HubConnection hubConnection,
    required WebRTCHangUp webRTCHangUp,
  }) async {
    await _sendWebRTCHangUp(hubConnection, webRTCHangUp.userId);
  }

  void disposePeerConnection() {
    assert(_peerConnection != null);
    _peerConnection!.dispose();
  }

  Future<void> _sendWebRTCOffer(HubConnection hubConnection, String userId,
      RTCSessionDescription description) async {
    await WebRTCHub.sendWebRTCOffer(
        hubConnection, userId, description.sdp!, description.type!);
  }

  Future<void> _sendWebRTCAnswer(HubConnection hubConnection, String userId,
      RTCSessionDescription description) async {
    await WebRTCHub.sendWebRTCAnswer(
        hubConnection, userId, description.sdp!, description.type!);
  }

  Future<void> _sendWebRTCIceCandidate(HubConnection hubConnection,
      String userId, RTCIceCandidate? candidate) async {
    if (candidate == null) return;
    await WebRTCHub.sendWebRTCIceCandidate(hubConnection, userId,
        candidate.sdpMlineIndex!, candidate.sdpMid!, candidate.candidate!);
  }

  Future<void> _sendWebRTCHangUp(
      HubConnection hubConnection, String userId) async {
    await WebRTCHub.sendWebRTCHangUp(hubConnection, userId);
  }

  void listenOff({required HubConnection hubConnection}) {
    webRTCHub.listenOff(hubConnection);
  }
}
