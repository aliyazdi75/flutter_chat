import 'package:flutter_chat/services/web_rtc/index.dart';

class WebRTCProvider {
  static Future<RTCVideoRenderer> activateVideoRender() async {
    return await WebRTCHelper.activateVideoRender();
  }

  static Future<void> deactivateVideoRender(
      MediaStream localMediaStream, RTCVideoRenderer videoRenderer) async {
    return await WebRTCHelper.deactivateVideoRender(
        localMediaStream, videoRenderer);
  }

  static Future<bool> hasTorch(MediaStream mediaStream) async {
    return await WebRTCHelper.hasTorch(mediaStream);
  }

  static Future<bool> toggleTorch(
      MediaStream mediaStream, bool torchStatus) async {
    return await WebRTCHelper.toggleTorch(mediaStream, torchStatus);
  }

  static Future<bool> switchCamera(MediaStream mediaStream) async {
    return await WebRTCHelper.switchCamera(mediaStream);
  }

  static bool toggleCameraActivation(
      MediaStream mediaStream, bool cameraActivationStatus) {
    return WebRTCHelper.toggleCameraActivation(
        mediaStream, cameraActivationStatus);
  }

  static bool toggleMicActivation(
      MediaStream mediaStream, bool micActivationStatus) {
    return WebRTCHelper.toggleMicActivation(mediaStream, micActivationStatus);
  }

  static Future<RTCPeerConnection> createPeerConnectionStream(
    MediaStream mediaStream, {
    IceCandidateCallback? onIceCandidate,
    IceConnectionStateCallback? onIceConnectionState,
    AddStreamCallback? onAddStream,
    RemoveStreamCallback? onRemoveStream,
  }) async {
    return await WebRTCHelper.createPeerConnectionStream(
      mediaStream,
      onIceCandidate: onIceCandidate,
      onIceConnectionState: onIceConnectionState,
      onAddStream: onAddStream,
      onRemoveStream: onRemoveStream,
    );
  }

  static Future<MediaStream> getUserMediaStream() async {
    return await WebRTCHelper.getUserMediaStream();
  }

  static Future<RTCSessionDescription> createOffer(
      RTCPeerConnection peerConnection) async {
    return await WebRTCHelper.createOffer(peerConnection);
  }

  static Future<RTCSessionDescription> createAnswer(
      RTCPeerConnection peerConnection) async {
    return await WebRTCHelper.createAnswer(peerConnection);
  }
}
