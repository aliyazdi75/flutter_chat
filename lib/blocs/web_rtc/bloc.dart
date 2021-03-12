import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/repositories/call/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/data/repositories/web_rtc/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class WebRTCBloc extends Bloc<WebRTCEvent, WebRTCState> {
  WebRTCBloc({
    @required this.userId,
    @required this.socketRepository,
    @required this.callRepository,
    @required this.webRTCRepository,
  })  : assert(userId != null),
        assert(socketRepository != null),
        assert(callRepository != null),
        assert(webRTCRepository != null),
        super(WebRTCState(userId: userId));

  final String userId;
  final SocketRepository socketRepository;
  final CallRepository callRepository;
  final WebRTCRepository webRTCRepository;

  @override
  Future<void> close() async {
    webRTCRepository.listenOff(hubConnection: socketRepository.hubConnection);
    await _disposeCall();
    await super.close();
  }

  @override
  Stream<WebRTCState> mapEventToState(WebRTCEvent event) async* {
    if (event is RequestCall) {
      yield* _mapRequestCallToState(event);
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
    } else if (event is HangUpCallRequested) {
      yield* _mapHangUpRequestedToState(event);
    } else if (event is CallHungUp) {
      yield* _mapCallHungUpToState(event);
    } else if (event is CallRejected) {
      yield* _mapCallRejectedToState(event);
    } else if (event is ToggleTorchRequested) {
      yield* _mapToggleTorchRequestedToState();
    } else if (event is SwitchCameraRequested) {
      yield* _mapSwitchCameraRequestedToState();
    } else if (event is ToggleMicMuteRequested) {
      yield* _mapToggleMicMuteRequestedToState();
    }
  }

  Stream<WebRTCState> _mapRequestCallToState(RequestCall event) async* {
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
      onWebRTCRejectReceived: (webRTCHangUp) => add(CallRejected(webRTCHangUp)),
    );

    yield state.copyWith(status: WebRTCStatus.ringing);
  }

  Stream<WebRTCState> _mapAnswerCallRequestedToState(
      AnswerCallRequested event) async* {
    assert(callRepository.webRTCOffer != null);

    yield* _initialVideoRenders();

    yield state.copyWith(status: WebRTCStatus.handShaking);

    await webRTCRepository.answerCall(
      hubConnection: socketRepository.hubConnection,
      webRTCOffer: callRepository.webRTCOffer,
      iceCandidates: callRepository.iceCandidates,
      onLocalVideoRenderActivated: (stream) =>
          add(LocalVideoRenderActivated(stream)),
      onRemoteVideoRenderActivated: (stream) =>
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

    final hasTorch =
        await webRTCRepository.hasTorch(mediaStream: event.localStream);
    yield state.copyWith(
      hasTorch: hasTorch,
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

  Future<void> _disposeCall() async {
    if (state.status != WebRTCStatus.hangUp) {
      await _sendHangUpRequest(WebRTCHangUp((b) => b..userId = state.userId));
    }
    await state.localMediaStream?.dispose();
    state.localVideoRender?.srcObject = null;
    await state.localVideoRender?.dispose();
    state.remoteVideoRender?.srcObject = null;
    await state.remoteVideoRender?.dispose();
  }

  Stream<WebRTCState> _mapHangUpRequestedToState(
      HangUpCallRequested event) async* {
    await _sendHangUpRequest(event.webRTCHangUp);
    yield state.copyWith(status: WebRTCStatus.hangUp);
  }

  Future<void> _sendHangUpRequest(WebRTCHangUp webRTCHangUp) async {
    await webRTCRepository.hangUp(
      hubConnection: socketRepository.hubConnection,
      webRTCHangUp: webRTCHangUp,
    );
  }

  Stream<WebRTCState> _mapCallHungUpToState(CallHungUp event) async* {
    if (state.userId == event.webRTCHangUp.userId) {
      yield state.copyWith(status: WebRTCStatus.hangUp);
    }
  }

  //Reject happens when the other user is on the other call
  Stream<WebRTCState> _mapCallRejectedToState(CallRejected event) async* {
    if (state.userId == event.webRTCReject.userId) {
      yield state.copyWith(status: WebRTCStatus.reject);
    }
  }

  Stream<WebRTCState> _mapToggleTorchRequestedToState() async* {
    assert(state.hasTorch);

    final torchStatus = await webRTCRepository.toggleTorch(
        mediaStream: state.localMediaStream, torchStatus: state.torchStatus);
    yield state.copyWith(torchStatus: torchStatus);
  }

  Stream<WebRTCState> _mapSwitchCameraRequestedToState() async* {
    final cameraFrontSideStatus = await webRTCRepository.switchCamera(
        mediaStream: state.localMediaStream);
    final hasTorch =
        await webRTCRepository.hasTorch(mediaStream: state.localMediaStream);
    yield state.copyWith(
      cameraFrontSideStatus: cameraFrontSideStatus,
      hasTorch: hasTorch,
      torchStatus: false,
    );
  }

  Stream<WebRTCState> _mapToggleMicMuteRequestedToState() async* {
    final micMuteStatus = webRTCRepository.toggleMicMute(
      mediaStream: state.localMediaStream,
      micMuteStatus: state.micMuteStatus,
    );
    yield state.copyWith(micMuteStatus: micMuteStatus);
  }
}
