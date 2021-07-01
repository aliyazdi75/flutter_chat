import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'exception.dart';

export 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCHelper {
  static Future<RTCVideoRenderer> activateVideoRender() async {
    final videoRender = RTCVideoRenderer();
    await videoRender.initialize();
    return videoRender;
  }

  static Future<void> deactivateVideoRender(
      MediaStream localMediaStream, RTCVideoRenderer videoRenderer) async {
    await localMediaStream.dispose();
    videoRenderer.srcObject = null;
    await videoRenderer.dispose();
  }

  static Future<MediaStream> getUserMediaStream() async {
    final mediaConstraints = <String, dynamic>{
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth': '1280',
          'minHeight': '720',
          'minFrameRate': '30',
        },
        'facingMode': 'user',
      }
    };

    try {
      return navigator.mediaDevices.getUserMedia(mediaConstraints);
    } catch (e) {
      throw GettingUserMediaException(e.toString());
    }
  }

  static Future<bool> hasTorch(MediaStream mediaStream) async {
    final videoTrack = mediaStream.getVideoTracks().first;
    return await videoTrack.hasTorch();
  }

  static Future<bool> toggleTorch(
      MediaStream mediaStream, bool torchStatus) async {
    final videoTrack = mediaStream.getVideoTracks().first;
    final hasTorch = await videoTrack.hasTorch();
    if (hasTorch) {
      await videoTrack.setTorch(!torchStatus);
      return !torchStatus;
    } else {
      throw TorchUnsupportedException();
    }
  }

  static Future<bool> switchCamera(MediaStream mediaStream) async {
    final videoTrack = mediaStream.getVideoTracks().first;
    try {
      if (kIsWeb) {
        final cameraDevices = await Helper.cameras;
        return await Helper.switchCamera(
          videoTrack,
          cameraDevices.first.deviceId,
          mediaStream,
        );
      } else {
        return await Helper.switchCamera(videoTrack);
      }
    } catch (e) {
      throw CameraSwitchException(e.toString());
    }
  }

  static bool toggleCameraActivation(
      MediaStream mediaStream, bool cameraActivationStatus) {
    final videoTrack = mediaStream.getVideoTracks().first;
    videoTrack.enabled = !cameraActivationStatus;
    return !cameraActivationStatus;
  }

  static bool toggleMicActivation(
      MediaStream mediaStream, bool micActivationStatus) {
    final audioTrack = mediaStream.getAudioTracks().first;
    audioTrack.setMicrophoneMute(!micActivationStatus);
    return !micActivationStatus;
  }

  static Future<RTCPeerConnection> createPeerConnectionStream(
    MediaStream mediaStream, {
    IceCandidateCallback? onIceCandidate,
    IceConnectionStateCallback? onIceConnectionState,
    AddStreamCallback? onAddStream,
    RemoveStreamCallback? onRemoveStream,
  }) async {
    final iceServers = {
      'iceServers': [
        {
          'url': 'stun:numb.viagenie.ca',
          'username': 'ma.yazdi75@gmail.com',
          'credential': 'CNL72teJDNbBNtx'
        },
        {
          'url': 'turn:numb.viagenie.ca',
          'username': 'ma.yazdi75@gmail.com',
          'credential': 'CNL72teJDNbBNtx'
        },
      ]
    };

    final configuration = {
      'mandatory': {
        'OfferToReceiveAudio': true,
        'OfferToReceiveVideo': true,
      },
      'optional': [
        {'DtlsSrtpKeyAgreement': true},
      ]
    };
    final peerConnection =
        await createPeerConnection(iceServers, configuration);
    await peerConnection.addStream(mediaStream);

    peerConnection.onIceCandidate = onIceCandidate;
    peerConnection.onIceConnectionState = onIceConnectionState;
    peerConnection.onAddStream = onAddStream;
    peerConnection.onRemoveStream = onRemoveStream;

    return peerConnection;
  }

  static Future<RTCSessionDescription> createOffer(
      RTCPeerConnection peerConnection) async {
    final offerSdpConstraints = {
      'mandatory': {
        'OfferToReceiveAudio': true,
        'OfferToReceiveVideo': true,
      },
      'optional': <dynamic>[],
    };
    try {
      return await peerConnection.createOffer(offerSdpConstraints);
    } catch (e) {
      throw CreatingOfferException(e.toString());
    }
  }

  static Future<RTCSessionDescription> createAnswer(
      RTCPeerConnection peerConnection) async {
    final answerSdpConstraints = {
      'mandatory': {
        'OfferToReceiveAudio': true,
        'OfferToReceiveVideo': true,
      },
      'optional': <dynamic>[],
    };
    try {
      return await peerConnection.createAnswer(answerSdpConstraints);
    } catch (e) {
      throw CreatingAnswerException(e.toString());
    }
  }
}
