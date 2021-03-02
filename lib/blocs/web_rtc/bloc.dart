import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/data/repositories/web_rtc/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class WebRTCBloc extends Bloc<WebRTCEvent, WebRTCState> {
  WebRTCBloc({
    @required this.socketRepository,
    @required this.webRTCRepository,
  })  : assert(socketRepository != null),
        assert(webRTCRepository != null),
        super(const WebRTCState());

  final WebRTCRepository webRTCRepository;
  final SocketRepository socketRepository;

  @override
  Future<void> close() async {
    webRTCRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await super.close();
  }

  @override
  Stream<WebRTCState> mapEventToState(WebRTCEvent event) async* {
    if (event is ReadyForCallRequested) {
      yield* _mapReadyForCallRequestedToState();
    } else if (event is WebRTCOfferReceived) {
      yield* _mapWebRTCOfferReceivedToState(event);
    } else if (event is CallingRequested) {
      yield* _mapCallingRequestedToState(event);
    } else if (event is CallAcceptRequested) {
      yield* _mapCallAcceptRequestedToState();
    } else if (event is AnswerCallRequested) {
      yield* _mapAnswerCallRequestedToState(event);
    } else if (event is LocalVideoRenderActivated) {
      yield* _mapLocalVideoRendersActivatedToState(event);
    } else if (event is RemoteVideoRenderActivated) {
      yield* _mapRemoteVideoRendersActivatedToState(event);
    } else if (event is LocalVideoRenderDeactivated) {
      yield* _mapLocalVideoRendersDeactivatedToState();
    } else if (event is RemoteVideoRenderDeactivated) {
      yield* _mapRemoteVideoRendersDeactivatedToState();
    } else if (event is RejectCallRequested) {
      yield* _mapCallRejectRequestedToState(event);
    } else if (event is CallRejected) {
      yield* _mapCallRejectedToState(event);
    } else if (event is HangUpCallRequested) {
      yield* _mapHangUpRequestedToState(event);
    } else if (event is CallHungUp) {
      yield* _mapCallHungUpToState(event);
    } else if (event is CallDeactivatedRequested) {
      yield* _mapCallDeactivatedRequestedToState(event);
    } else if (event is ToggleTorchRequested) {
      yield* _mapToggleTorchRequestedToState();
    } else if (event is SwitchCameraRequested) {
      yield* _mapSwitchCameraRequestedToState();
    } else if (event is ToggleMicMuteRequested) {
      yield* _mapToggleMicMuteRequestedToState();
    }
  }

  //todo: refuse calls when we are in a call
  Stream<WebRTCState> _mapReadyForCallRequestedToState() async* {
    webRTCRepository.listenOnWebRTCOfferReceived(
      hubConnection: socketRepository.hubConnection,
      onWebRTCOfferReceived: (webRTCOffer) =>
          add(WebRTCOfferReceived(webRTCOffer)),
    );
    webRTCRepository.listenOnWebRTCRejectReceived(
      hubConnection: socketRepository.hubConnection,
      onWebRTCRejectReceived: (webRTCReject) => add(CallRejected(webRTCReject)),
    );
    yield state.copyWith(status: WebRTCStatus.readyForCall);
  }

  Stream<WebRTCState> _mapWebRTCOfferReceivedToState(
      WebRTCOfferReceived event) async* {
    yield state.copyWith(
      status: WebRTCStatus.callReceivedRinging,
      webRTCOffer: event.webRTCOffer,
    );
  }

  Stream<WebRTCState> _mapCallingRequestedToState(
      CallingRequested event) async* {
    yield* _initialVideoRenders();

    await webRTCRepository.requestCall(
      hubConnection: socketRepository.hubConnection,
      userId: event.userId,
      onLocalVideoRenderActivated: (stream) =>
          add(LocalVideoRenderActivated(stream)),
      onRemoteVideoRenderActivated: (stream) =>
          add(RemoteVideoRenderActivated(stream)),
      onRemoteVideoRenderDeactivated: (stream) =>
          add(const RemoteVideoRenderDeactivated()),
      onWebRTCHangUpReceived: (webRTCHangUp) =>
          add(HangUpCallRequested(webRTCHangUp)),
    );

    yield state.copyWith(status: WebRTCStatus.callSentRinging);
  }

  Stream<WebRTCState> _mapCallAcceptRequestedToState() async* {
    assert(state.status == WebRTCStatus.callReceivedRinging);

    yield state.copyWith(status: WebRTCStatus.accept);
  }

  Stream<WebRTCState> _mapAnswerCallRequestedToState(
      AnswerCallRequested event) async* {
    assert(state.status == WebRTCStatus.accept);

    yield* _initialVideoRenders();

    yield state.copyWith(
      status: WebRTCStatus.handShaking,
      webRTCOffer: state.webRTCOffer,
    );

    await webRTCRepository.answerCall(
      hubConnection: socketRepository.hubConnection,
      webRTCOffer: state.webRTCOffer,
      onLocalVideoRenderActivated: (stream) =>
          add(LocalVideoRenderActivated(stream)),
      onRemoteVideoRenderdActivated: (stream) =>
          add(RemoteVideoRenderActivated(stream)),
      onRemoteVideoRenderDeactivated: (stream) =>
          add(const RemoteVideoRenderDeactivated()),
      onWebRTCHangUpReceived: (webRTCHangUp) =>
          add(HangUpCallRequested(webRTCHangUp)),
    );

    yield state.copyWith(status: WebRTCStatus.inCall);
  }

  Stream<WebRTCState> _initialVideoRenders() async* {
    yield state.copyWith(status: WebRTCStatus.videoRendersActivationLoading);
    final localVideoRender = await webRTCRepository.activateVideoRender();
    final remoteVideoRender = await webRTCRepository.activateVideoRender();
    yield state.copyWith(
      status: WebRTCStatus.handShaking,
      localVideoRender: localVideoRender,
      remoteVideoRender: remoteVideoRender,
    );
  }

  Stream<WebRTCState> _mapLocalVideoRendersActivatedToState(
      LocalVideoRenderActivated event) async* {
    assert(state.localVideoRender != null);
    //todo: test this
    // final hasTorch = await webRTCRepository.hasTorch();
    yield state.copyWith(
      localMediaStream: event.localStream,
      localVideoRender: state.localVideoRender..srcObject = event.localStream,
      localVideoRendererActivationStatus: true,
    );
  }

  Stream<WebRTCState> _mapRemoteVideoRendersActivatedToState(
      RemoteVideoRenderActivated event) async* {
    assert(state.remoteVideoRender != null);

    yield state.copyWith(
      remoteVideoRender: state.remoteVideoRender
        ..srcObject = event.remoteStream,
      remoteVideoRendererActivationStatus: true,
    );
  }

  Stream<WebRTCState> _mapLocalVideoRendersDeactivatedToState() async* {
    assert(state.localVideoRendererActivationStatus);

    yield state.copyWith(
      localVideoRender: state.localVideoRender..srcObject = null,
      localVideoRendererActivationStatus: false,
    );
  }

  Stream<WebRTCState> _mapRemoteVideoRendersDeactivatedToState() async* {
    assert(state.remoteVideoRendererActivationStatus);

    yield state.copyWith(
      remoteVideoRender: state.remoteVideoRender..srcObject = null,
      remoteVideoRendererActivationStatus: false,
    );
  }

  Stream<WebRTCState> _mapCallRejectRequestedToState(
      RejectCallRequested event) async* {
    assert(state.status == WebRTCStatus.callReceivedRinging);

    yield state.copyWith(
      status: WebRTCStatus.reject,
      webRTCReject: event.webRTCReject,
    );

    await webRTCRepository.reject(
      hubConnection: socketRepository.hubConnection,
      webRTCReject: event.webRTCReject,
    );
  }

  Stream<WebRTCState> _mapCallRejectedToState(CallRejected event) async* {
    assert(state.status == WebRTCStatus.callSentRinging);

    yield state.copyWith(
      status: WebRTCStatus.reject,
      webRTCReject: event.webRTCReject,
    );
  }

  Stream<WebRTCState> _mapHangUpRequestedToState(
      HangUpCallRequested event) async* {
    assert(state.status == WebRTCStatus.inCall);

    yield state.copyWith(
      status: WebRTCStatus.hangUp,
      webRTCHangUp: event.webRTCHangUp,
    );

    await webRTCRepository.hangUp(
      hubConnection: socketRepository.hubConnection,
      webRTCHangUp: event.webRTCHangUp,
    );
  }

  Stream<WebRTCState> _mapCallHungUpToState(CallHungUp event) async* {
    assert(state.status == WebRTCStatus.inCall);

    yield state.copyWith(
      status: WebRTCStatus.hangUp,
      webRTCHangUp: event.webRTCHangUp,
    );
  }

  Stream<WebRTCState> _mapCallDeactivatedRequestedToState(
      CallDeactivatedRequested event) async* {
    switch (state.status) {
      case WebRTCStatus.inCall:
        //todo: this add event, returns the first state
        // add(HangUpRequested(WebRTCHangUp((b) => b..userId = event.userId)));
        break;
      case WebRTCStatus.callSentRinging:
        //todo: this add event, returns the first state
        // add(CallRejectRequested(WebRTCReject((b) => b..userId = event.userId)));
        break;
      default:
        break;
    }

    if (state.localVideoRendererActivationStatus) {
      await state.localMediaStream.dispose();
      state.localVideoRender.srcObject = null;
      await state.localVideoRender.dispose();
      state.remoteVideoRender.srcObject = null;
      await state.remoteVideoRender.dispose();
    }

    yield const WebRTCState.readyForCall();
  }

  Stream<WebRTCState> _mapToggleTorchRequestedToState() async* {
    assert(state.hasTorch);

    // final torchStatus = await webRTCRepository.toggleTorch(state.torchStatus);
    // yield state.copyWith(torchStatus: torchStatus);
  }

  Stream<WebRTCState> _mapSwitchCameraRequestedToState() async* {
    // final cameraFrontSideStatus = await webRTCRepository.switchCamera();
    // yield state.copyWith(cameraFrontSideStatus: cameraFrontSideStatus);
  }

  Stream<WebRTCState> _mapToggleMicMuteRequestedToState() async* {
    // final micMuteStatus = webRTCRepository.toggleMicMute(state.micMuteStatus);
    // yield state.copyWith(micMuteStatus: micMuteStatus);
  }
}
