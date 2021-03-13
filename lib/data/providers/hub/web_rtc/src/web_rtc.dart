import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/services/signalR/index.dart';

class WebRTCHub {
  List<HubMethod> listenOnHubMethod = <HubMethod>[];

  void listenOnWebRTCOfferReceived(
    HubConnection hubConnection,
    Function(WebRTCOffer webRTCOffer) onWebRTCOfferReceived,
  ) {
    final SocketResponseCallBack webRTCOffer =
        (response) => onWebRTCOfferReceived(WebRTCOffer.fromJson(response));
    final hubMethod = HubMethod(webRTCOfferMethodName,
        SignalRHelper.toSocketFunction(webRTCOfferMethodName, webRTCOffer));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnWebRTCAnswerReceived(
    HubConnection hubConnection,
    Function(WebRTCAnswer webRTCAnswer) onWebRTCAnswerReceived,
  ) {
    final SocketResponseCallBack webRTCAnswer =
        (response) => onWebRTCAnswerReceived(WebRTCAnswer.fromJson(response));
    final hubMethod = HubMethod(webRTCAnswerMethodName,
        SignalRHelper.toSocketFunction(webRTCAnswerMethodName, webRTCAnswer));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnWebRTCRejectReceived(
    HubConnection hubConnection,
    Function(WebRTCReject webRTCReject) onWebRTCRejectReceived,
  ) {
    final SocketResponseCallBack webRTCReject =
        (response) => onWebRTCRejectReceived(WebRTCReject.fromJson(response));
    final hubMethod = HubMethod(webRTCRejectMethodName,
        SignalRHelper.toSocketFunction(webRTCRejectMethodName, webRTCReject));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnWebRTCIceCandidateReceived(
    HubConnection hubConnection,
    Function(WebRTCIceCandidate webRTCIceCandidate)
        onWebRTCIceCandidateReceived,
  ) {
    final SocketResponseCallBack webRTCIceCandidate = (response) =>
        onWebRTCIceCandidateReceived(WebRTCIceCandidate.fromJson(response));
    final hubMethod = HubMethod(
        webRTCIceCandidateMethodName,
        SignalRHelper.toSocketFunction(
            webRTCIceCandidateMethodName, webRTCIceCandidate));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOnWebRTCHangUpReceived(
    HubConnection hubConnection,
    Function(WebRTCHangUp webRTCHangUp) onWebRTCHangUpReceived,
  ) {
    final SocketResponseCallBack webRTCHangUp =
        (response) => onWebRTCHangUpReceived(WebRTCHangUp.fromJson(response));
    final hubMethod = HubMethod(webRTCHangUpMethodName,
        SignalRHelper.toSocketFunction(webRTCHangUpMethodName, webRTCHangUp));
    if (listenOnHubMethod.contains(hubMethod)) return;
    SignalRHelper(hubConnection: hubConnection).on(
      hubMethod.methodName,
      hubMethod.methodFunction,
    );
    listenOnHubMethod.add(hubMethod);
  }

  void listenOff(HubConnection hubConnection) {
    listenOnHubMethod.forEach(
      (hubMethod) => SignalRHelper(hubConnection: hubConnection).off(
        hubMethod.methodName,
        responseCallBack: hubMethod.methodFunction,
      ),
    );
    listenOnHubMethod = const <HubMethod>[];
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
