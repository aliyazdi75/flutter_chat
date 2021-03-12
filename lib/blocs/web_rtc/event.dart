part of 'bloc.dart';

@immutable
abstract class WebRTCEvent extends Equatable {
  const WebRTCEvent();

  @override
  List<Object> get props => [];
}

class WebRTCIceCandidateReceived extends WebRTCEvent {
  const WebRTCIceCandidateReceived(this.webRTCIceCandidate);

  final WebRTCIceCandidate webRTCIceCandidate;

  @override
  List<Object> get props => [webRTCIceCandidate];
}

class RequestCall extends WebRTCEvent {
  const RequestCall(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class AnswerCallRequested extends WebRTCEvent {
  const AnswerCallRequested(this.webRTCOffer);

  final WebRTCOffer webRTCOffer;

  @override
  List<Object> get props => [webRTCOffer];
}

class LocalVideoRenderActivated extends WebRTCEvent {
  const LocalVideoRenderActivated(this.localStream);

  final MediaStream localStream;

  @override
  List<Object> get props => [localStream];
}

class RemoteVideoRenderActivated extends WebRTCEvent {
  const RemoteVideoRenderActivated(this.remoteStream);

  final MediaStream remoteStream;

  @override
  List<Object> get props => [remoteStream];
}

class LocalVideoRenderDeactivated extends WebRTCEvent {
  const LocalVideoRenderDeactivated();
}

class RemoteVideoRenderDeactivated extends WebRTCEvent {
  const RemoteVideoRenderDeactivated();
}

class HangUpCallRequested extends WebRTCEvent {
  const HangUpCallRequested(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object> get props => [webRTCHangUp];
}

class CallHungUp extends WebRTCEvent {
  const CallHungUp(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object> get props => [webRTCHangUp];
}

class CallRejected extends WebRTCEvent {
  const CallRejected(this.webRTCReject);

  final WebRTCReject webRTCReject;

  @override
  List<Object> get props => [webRTCReject];
}

class CallDeactivatedRequested extends WebRTCEvent {
  const CallDeactivatedRequested(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}

class ToggleTorchRequested extends WebRTCEvent {
  const ToggleTorchRequested();
}

class SwitchCameraRequested extends WebRTCEvent {
  const SwitchCameraRequested();
}

class ToggleMicMuteRequested extends WebRTCEvent {
  const ToggleMicMuteRequested();
}
