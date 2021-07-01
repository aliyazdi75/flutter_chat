import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  int get id;

  bool get seen;

  bool get sentByMe;

  bool get isSent;

  DateTime get sentAt;

  MessageType get type;

  String get text;

  Message._();

  factory Message([void Function(MessageBuilder) updates]) = _$Message;

  static void _initializeBuilder(MessageBuilder builder) =>
      builder..isSent = true;

  static Message fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Message.serializer, json)!;
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}

class MessageType extends EnumClass {
  @BuiltValueEnumConst(wireName: 'Text')
  static const MessageType text = _$text;

  @BuiltValueEnumConst(wireName: 'Image')
  static const MessageType image = _$image;

  @BuiltValueEnumConst(wireName: 'Video')
  static const MessageType video = _$video;

  const MessageType._(String name) : super(name);

  static BuiltSet<MessageType> get values => _$messageTypeValues;

  static MessageType valueOf(String name) => _$messageTypeValueOf(name);

  static MessageType deserialize(String string) {
    return serializers.deserializeWith(MessageType.serializer, string)!;
  }

  static Serializer<MessageType> get serializer => _$messageTypeSerializer;
}
