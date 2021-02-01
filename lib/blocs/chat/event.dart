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

class CloseChatRequested extends ChatEvent {
  const CloseChatRequested();
}

class SendChatMessageRequested extends ChatEvent {
  const SendChatMessageRequested(this.messageText);

  final String messageText;

  @override
  List<Object> get props => [messageText];
}

class SendUserIsTypingRequested extends ChatEvent {
  const SendUserIsTypingRequested();
}

class SendUserChatSeenRequested extends ChatEvent {
  const SendUserChatSeenRequested();
}
