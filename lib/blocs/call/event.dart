part of 'bloc.dart';

@immutable
abstract class CallEvent extends Equatable {
  const CallEvent();

  @override
  List<Object> get props => [];
}

class ReadyForCallRequested extends CallEvent {
  const ReadyForCallRequested();
}

class WebRTCOfferReceived extends CallEvent {
  const WebRTCOfferReceived(this.webRTCOffer);

  final WebRTCOffer webRTCOffer;

  @override
  List<Object> get props => [webRTCOffer];
}

class CallAcceptRequested extends CallEvent {
  const CallAcceptRequested();
}

class RejectCallRequested extends CallEvent {
  const RejectCallRequested(this.webRTCReject);

  final WebRTCReject webRTCReject;

  @override
  List<Object> get props => [webRTCReject];
}

class HangUpCallRequested extends CallEvent {
  const HangUpCallRequested(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object> get props => [webRTCHangUp];
}

class CallHungUp extends CallEvent {
  const CallHungUp(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object> get props => [webRTCHangUp];
}
