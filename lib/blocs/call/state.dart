part of 'bloc.dart';

enum CallStatus { initial, readyForCall, ringing, hangUp, inCall }

class CallState extends Equatable {
  const CallState({
    this.status = CallStatus.initial,
    this.webRTCOffer,
  });

  final CallStatus status;
  final WebRTCOffer? webRTCOffer;

  const CallState.readyForCall() : this(status: CallStatus.readyForCall);

  CallState copyWith({
    CallStatus? status,
    WebRTCOffer? webRTCOffer,
  }) {
    return CallState(
      status: status ?? this.status,
      webRTCOffer: webRTCOffer ?? this.webRTCOffer,
    );
  }

  @override
  List<Object?> get props => [status];
}
