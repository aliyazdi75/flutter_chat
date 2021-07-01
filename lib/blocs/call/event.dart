part of 'bloc.dart';

@immutable
abstract class CallEvent extends Equatable {
  const CallEvent();

  @override
  List<Object?> get props => [];
}

class ReadyForCallRequested extends CallEvent {
  const ReadyForCallRequested();
}

class WebRTCOfferReceived extends CallEvent {
  const WebRTCOfferReceived(this.webRTCOffer);

  final WebRTCOffer webRTCOffer;

  @override
  List<Object?> get props => [webRTCOffer];
}

class CallAcceptRequested extends CallEvent {
  const CallAcceptRequested();
}

class RejectCallRequested extends CallEvent {
  const RejectCallRequested(this.webRTCReject);

  final WebRTCReject webRTCReject;

  @override
  List<Object?> get props => [webRTCReject];
}

class EndCallRequested extends CallEvent {
  const EndCallRequested(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object?> get props => [webRTCHangUp];
}

class CallEnded extends CallEvent {
  const CallEnded(this.webRTCHangUp);

  final WebRTCHangUp webRTCHangUp;

  @override
  List<Object?> get props => [webRTCHangUp];
}
