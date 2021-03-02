import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';

class _HubMethod {
  _HubMethod(this.methodName, this.methodFunction);

  final String methodName;
  final SocketResponseCallBack methodFunction;
}

class WebRTCHub {
  List<_HubMethod> _hubMethodListenOnList = <_HubMethod>[];

  void listenOnWebRTCOfferReceived(
    HubConnection hubConnection,
    Function(WebRTCOffer webRTCOffer) onWebRTCOfferReceived,
  ) {
    final SocketResponseCallBack webRTCOffer =
        (response) => onWebRTCOfferReceived(WebRTCOffer.fromJson(response));
    final hubMethod = _HubMethod(webRTCOfferMethodName, webRTCOffer);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      webRTCOfferMethodName,
      webRTCOffer,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnWebRTCAnswerReceived(
    HubConnection hubConnection,
    Function(WebRTCAnswer webRTCAnswer) onWebRTCAnswerReceived,
  ) {
    final SocketResponseCallBack webRTCAnswer =
        (response) => onWebRTCAnswerReceived(WebRTCAnswer.fromJson(response));
    final hubMethod = _HubMethod(webRTCAnswerMethodName, webRTCAnswer);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      webRTCAnswerMethodName,
      webRTCAnswer,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnWebRTCRejectReceived(
    HubConnection hubConnection,
    Function(WebRTCReject webRTCReject) onWebRTCRejectReceived,
  ) {
    final SocketResponseCallBack webRTCReject =
        (response) => onWebRTCRejectReceived(WebRTCReject.fromJson(response));
    final hubMethod = _HubMethod(webRTCRejectMethodName, webRTCReject);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      webRTCRejectMethodName,
      webRTCReject,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnWebRTCIceCandidateReceived(
    HubConnection hubConnection,
    Function(WebRTCIceCandidate webRTCIceCandidate)
        onWebRTCIceCandidateReceived,
  ) {
    final SocketResponseCallBack webRTCIceCandidate = (response) =>
        onWebRTCIceCandidateReceived(WebRTCIceCandidate.fromJson(response));
    final hubMethod =
        _HubMethod(webRTCIceCandidateMethodName, webRTCIceCandidate);
    if (_hubMethodListenOnList.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      webRTCIceCandidateMethodName,
      webRTCIceCandidate,
    );
    _hubMethodListenOnList.add(hubMethod);
  }

  void listenOnWebRTCHangUpReceived(
    HubConnection hubConnection,
    Function(WebRTCHangUp webRTCHangUp) onWebRTCHangUpReceived,
  ) {
    final SocketResponseCallBack webRTCHangUp =
        (response) => onWebRTCHangUpReceived(WebRTCHangUp.fromJson(response));
    if (_hubMethodListenOnList
        .contains(_HubMethod(webRTCHangUpMethodName, webRTCHangUp))) return;
    SignalRHelper(hubConnection: hubConnection).on(
      webRTCHangUpMethodName,
      webRTCHangUp,
    );
    _hubMethodListenOnList
        .add(_HubMethod(webRTCHangUpMethodName, webRTCHangUp));
  }

  void listenOff(HubConnection hubConnection) {
    _hubMethodListenOnList.forEach(
      (hubMethod) => SignalRHelper(hubConnection: hubConnection).off(
        hubMethod.methodName,
        responseCallBack: hubMethod.methodFunction,
      ),
    );
    _hubMethodListenOnList = const <_HubMethod>[];
  }

  static Future<void> sendWebRTCOffer(
    HubConnection hubConnection,
    String userId,
    String sdp,
    String type,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      webRTCOfferMethodName,
      args: <dynamic>[userId, sdp, type],
    );
  }

  static Future<void> sendWebRTCAnswer(
    HubConnection hubConnection,
    String userId,
    String sdp,
    String type,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      webRTCAnswerMethodName,
      args: <dynamic>[userId, sdp, type],
    );
  }

  static Future<void> sendWebRTCIceCandidate(
    HubConnection hubConnection,
    String userId,
    int sdpMLineIndex,
    String sdpMid,
    String candidate,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      webRTCIceCandidateMethodName,
      args: <dynamic>[userId, sdpMLineIndex, sdpMid, candidate],
    );
  }

  static Future<void> sendWebRTCHangUp(
    HubConnection hubConnection,
    String userId,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      webRTCHangUpMethodName,
      args: <dynamic>[userId],
    );
  }

  static Future<void> sendWebRTCReject(
    HubConnection hubConnection,
    String userId,
  ) async {
    await SignalRHelper(hubConnection: hubConnection).invoke(
      webRTCRejectMethodName,
      args: <dynamic>[userId],
    );
  }
}
