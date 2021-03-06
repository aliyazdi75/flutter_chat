part of 'bloc.dart';

enum WebRTCStatus {
  initial,
  readyForCall,
  videoRendersActivationLoading,
  callSentRinging,
  callReceivedRinging,
  handShaking,
  inCall,
  accept,
  reject,
  hangUp,
  failure,
}

class WebRTCState extends Equatable {
  const WebRTCState({
    this.status = WebRTCStatus.initial,
    this.localMediaStream,
    this.webRTCOffer,
    this.webRTCReject,
    this.webRTCHangUp,
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
  final MediaStream localMediaStream;
  final WebRTCOffer webRTCOffer;
  final WebRTCReject webRTCReject;
  final WebRTCHangUp webRTCHangUp;
  final RTCVideoRenderer localVideoRender;
  final RTCVideoRenderer remoteVideoRender;
  final bool hasTorch;
  final bool localVideoRendererActivationStatus;
  final bool remoteVideoRendererActivationStatus;
  final bool torchStatus;
  final bool cameraFrontSideStatus;
  final bool micMuteStatus;

  const WebRTCState.readyForCall() : this(status: WebRTCStatus.readyForCall);

  WebRTCState copyWith({
    WebRTCStatus status,
    MediaStream localMediaStream,
    WebRTCOffer webRTCOffer,
    WebRTCReject webRTCReject,
    WebRTCHangUp webRTCHangUp,
    RTCVideoRenderer localVideoRender,
    RTCVideoRenderer remoteVideoRender,
    bool hasTorch,
    bool localVideoRendererActivationStatus,
    bool remoteVideoRendererActivationStatus,
    bool torchStatus,
    bool cameraFrontSideStatus,
    bool micMuteStatus,
  }) {
    return WebRTCState(
      status: status ?? this.status,
      webRTCOffer: webRTCOffer ?? this.webRTCOffer,
      localMediaStream: localMediaStream ?? this.localMediaStream,
      webRTCReject: webRTCReject ?? this.webRTCReject,
      webRTCHangUp: webRTCHangUp ?? this.webRTCHangUp,
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
  List<Object> get props => [
        status,
        localVideoRendererActivationStatus,
        remoteVideoRendererActivationStatus,
        hasTorch,
        torchStatus,
        cameraFrontSideStatus,
        micMuteStatus,
      ];
}
