import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/repositories/call/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class CallBloc extends Bloc<CallEvent, CallState> {
  CallBloc({
    required this.socketRepository,
    required this.callRepository,
  }) : super(const CallState());

  final SocketRepository socketRepository;
  final CallRepository callRepository;

  @override
  Future<void> close() async {
    callRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await super.close();
  }

  @override
  Stream<CallState> mapEventToState(CallEvent event) async* {
    if (event is ReadyForCallRequested) {
      yield* _mapReadyForCallRequestedToState();
    } else if (event is WebRTCOfferReceived) {
      yield* _mapWebRTCOfferReceivedToState(event);
    } else if (event is CallAcceptRequested) {
      yield* _mapCallAcceptRequestedToState();
    } else if (event is EndCallRequested) {
      yield* _mapEndCallRequestedToState(event);
    } else if (event is CallEnded) {
      yield* _mapCallEndedToState(event);
    } else if (event is RejectCallRequested) {
      yield* _mapRejectCallRequestedToState(event);
    }
  }

  Stream<CallState> _mapReadyForCallRequestedToState() async* {
    if (state.status == CallStatus.initial) {
      callRepository.listenOnWebRTCOfferReceived(
        hubConnection: socketRepository.hubConnection,
        onWebRTCOfferReceived: (webRTCOffer) =>
            add(WebRTCOfferReceived(webRTCOffer)),
      );
      callRepository.listenOnWebRTCHangUpReceived(
        hubConnection: socketRepository.hubConnection,
        onWebRTCHangUpReceived: (webRTCHangUp) => add(CallEnded(webRTCHangUp)),
      );
      callRepository.listenOnWebRTCIceCandidateReceived(
        hubConnection: socketRepository.hubConnection,
      );
    }

    callRepository.resetCallRepository();
    yield const CallState.readyForCall();
  }

  Stream<CallState> _mapWebRTCOfferReceivedToState(
      WebRTCOfferReceived event) async* {
    if (state.status == CallStatus.readyForCall) {
      yield state.copyWith(
        status: CallStatus.ringing,
        webRTCOffer: event.webRTCOffer,
      );
    } else if (callRepository.userId != event.webRTCOffer.userId) {
      //Reject call automatically when the user is on the other call
      add(RejectCallRequested(
          WebRTCReject((b) => b..userId = event.webRTCOffer.userId)));
    }
  }

  Stream<CallState> _mapCallAcceptRequestedToState() async* {
    assert(state.status == CallStatus.ringing);

    callRepository.webRTCOffer = state.webRTCOffer;
    yield state.copyWith(status: CallStatus.inCall);
  }

  Stream<CallState> _mapEndCallRequestedToState(EndCallRequested event) async* {
    yield state.copyWith(status: CallStatus.hangUp);

    await callRepository.hangUp(
      hubConnection: socketRepository.hubConnection,
      webRTCHangUp: event.webRTCHangUp,
    );
  }

  Stream<CallState> _mapCallEndedToState(CallEnded event) async* {
    if (callRepository.userId == event.webRTCHangUp.userId) {
      yield state.copyWith(status: CallStatus.hangUp);
    }
  }

  Stream<CallState> _mapRejectCallRequestedToState(
      RejectCallRequested event) async* {
    await callRepository.reject(
      hubConnection: socketRepository.hubConnection,
      webRTCReject: event.webRTCReject,
    );
  }
}
