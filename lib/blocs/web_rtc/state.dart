part of 'bloc.dart';

enum WebRTCStatus {
  initial,
  videoRendersActivationLoading,
  ringing,
  handShaking,
  inCall,
  reject,
  hangUp,
  failure,
}

class WebRTCState extends Equatable {
  const WebRTCState({
    this.status = WebRTCStatus.initial,
    this.userId,
    this.iceCandidates = const <RTCIceCandidate>[],
    this.localMediaStream,
    this.localVideoRender,
    this.remoteVideoRender,
    this.hasTorch = true,
    this.localVideoRendererActivationStatus = false,
    this.remoteVideoRendererActivationStatus = false,
    this.torchStatus = false,
    this.cameraFrontSideStatus = true,
    this.micMuteStatus = false,
  });

  final WebRTCStatus status;
  final String? userId;
  final List<RTCIceCandidate> iceCandidates;
  final MediaStream? localMediaStream;
  final RTCVideoRenderer? localVideoRender;
  final RTCVideoRenderer? remoteVideoRender;
  final bool hasTorch;
  final bool localVideoRendererActivationStatus;
  final bool remoteVideoRendererActivationStatus;
  final bool torchStatus;
  final bool cameraFrontSideStatus;
  final bool micMuteStatus;

  WebRTCState copyWith({
    WebRTCStatus? status,
    String? userId,
    List<RTCIceCandidate>? iceCandidates,
    MediaStream? localMediaStream,
    RTCVideoRenderer? localVideoRender,
    RTCVideoRenderer? remoteVideoRender,
    bool? hasTorch,
    bool? localVideoRendererActivationStatus,
    bool? remoteVideoRendererActivationStatus,
    bool? torchStatus,
    bool? cameraFrontSideStatus,
    bool? micMuteStatus,
  }) {
    return WebRTCState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      iceCandidates: iceCandidates ?? this.iceCandidates,
      localMediaStream: localMediaStream ?? this.localMediaStream,
      localVideoRender: localVideoRender ?? this.localVideoRender,
      remoteVideoRender: remoteVideoRender ?? this.remoteVideoRender,
      hasTorch: hasTorch ?? this.hasTorch,
      localVideoRendererActivationStatus: localVideoRendererActivationStatus ??
          this.localVideoRendererActivationStatus,
      remoteVideoRendererActivationStatus:
          remoteVideoRendererActivationStatus ??
              this.remoteVideoRendererActivationStatus,
      torchStatus: torchStatus ?? this.torchStatus,
      cameraFrontSideStatus:
          cameraFrontSideStatus ?? this.cameraFrontSideStatus,
      micMuteStatus: micMuteStatus ?? this.micMuteStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        localVideoRendererActivationStatus,
        remoteVideoRendererActivationStatus,
        hasTorch,
        torchStatus,
        cameraFrontSideStatus,
        micMuteStatus,
      ];
}
