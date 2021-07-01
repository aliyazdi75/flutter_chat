import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'web_rtc.g.dart';

abstract class WebRTCOffer implements Built<WebRTCOffer, WebRTCOfferBuilder> {
  String get userId;

  String get sdp;

  WebRTCType get type;

  WebRTCOffer._();

  factory WebRTCOffer([void Function(WebRTCOfferBuilder) updates]) =
      _$WebRTCOffer;

  static WebRTCOffer fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WebRTCOffer.serializer, json)!;
  }

  static Serializer<WebRTCOffer> get serializer => _$webRTCOfferSerializer;
}

abstract class WebRTCAnswer
    implements Built<WebRTCAnswer, WebRTCAnswerBuilder> {
  String get userId;

  String get sdp;

  WebRTCType get type;

  WebRTCAnswer._();

  factory WebRTCAnswer([void Function(WebRTCAnswerBuilder) updates]) =
      _$WebRTCAnswer;

  static WebRTCAnswer fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WebRTCAnswer.serializer, json)!;
  }

  static Serializer<WebRTCAnswer> get serializer => _$webRTCAnswerSerializer;
}

class WebRTCType extends EnumClass {
  static const WebRTCType answer = _$answer;
  static const WebRTCType offer = _$offer;

  const WebRTCType._(String name) : super(name);

  static BuiltSet<WebRTCType> get values => _$webRTCTypeValues;

  static WebRTCType valueOf(String name) => _$webRTCTypeValueOf(name);

  static WebRTCType deserialize(String string) {
    return serializers.deserializeWith(WebRTCType.serializer, string)!;
  }

  static Serializer<WebRTCType> get serializer => _$webRTCTypeSerializer;
}

abstract class WebRTCReject
    implements Built<WebRTCReject, WebRTCRejectBuilder> {
  String get userId;

  WebRTCReject._();

  factory WebRTCReject([void Function(WebRTCRejectBuilder) updates]) =
      _$WebRTCReject;

  static WebRTCReject fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WebRTCReject.serializer, json)!;
  }

  static Serializer<WebRTCReject> get serializer => _$webRTCRejectSerializer;
}

abstract class WebRTCIceCandidate
    implements Built<WebRTCIceCandidate, WebRTCIceCandidateBuilder> {
  String get userId;

  int get sdpMLineIndex;

  String get sdpMid;

  String get candidate;

  WebRTCIceCandidate._();

  factory WebRTCIceCandidate(
          [void Function(WebRTCIceCandidateBuilder) updates]) =
      _$WebRTCIceCandidate;

  static WebRTCIceCandidate fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WebRTCIceCandidate.serializer, json)!;
  }

  static Serializer<WebRTCIceCandidate> get serializer =>
      _$webRTCIceCandidateSerializer;
}

abstract class WebRTCHangUp
    implements Built<WebRTCHangUp, WebRTCHangUpBuilder> {
  String get userId;

  WebRTCHangUp._();

  factory WebRTCHangUp([void Function(WebRTCHangUpBuilder) updates]) =
      _$WebRTCHangUp;

  static WebRTCHangUp fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(WebRTCHangUp.serializer, json)!;
  }

  static Serializer<WebRTCHangUp> get serializer => _$webRTCHangUpSerializer;
}
