part of 'bloc.dart';

@immutable
abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class OpenChatRequested extends ChatEvent {
  const OpenChatRequested();
}

class GetMessagesRequested extends ChatEvent {
  const GetMessagesRequested(this.userId, this.maxId);

  final String userId;
  final int maxId;

  @override
  List<Object> get props => [userId, maxId];
}

class ReadChatRequested extends ChatEvent {
  const ReadChatRequested({this.read = true});

  final bool read;

  @override
  List<Object> get props => [read];
}

class SendChatMessageRequested extends ChatEvent {
  const SendChatMessageRequested();
}

class SendUserChatSeenRequested extends ChatEvent {
  const SendUserChatSeenRequested();
}

class TextMessageChanged extends ChatEvent {
  const TextMessageChanged(this.textMessage);

  final String textMessage;

  @override
  List<Object> get props => [textMessage];
}
