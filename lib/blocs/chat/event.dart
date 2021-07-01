part of 'bloc.dart';

@immutable
abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class OpenChatRequested extends ChatEvent {
  const OpenChatRequested();
}

class GetMessagesRequested extends ChatEvent {
  const GetMessagesRequested(this.userId, this.maxId);

  final String userId;
  final int maxId;

  @override
  List<Object?> get props => [userId, maxId];
}

class StatusChanged extends ChatEvent {
  const StatusChanged(this.onStatusChanged);

  final ChatStatusChange onStatusChanged;

  @override
  List<Object?> get props => [onStatusChanged];
}

class MessageReceived extends ChatEvent {
  const MessageReceived(this.onChatMessageReceived);

  final ChatMessageReceive onChatMessageReceived;

  @override
  List<Object?> get props => [onChatMessageReceived];
}

class ChatSeenReceived extends ChatEvent {
  const ChatSeenReceived(this.onMessageSeen);

  final ChatSeen onMessageSeen;

  @override
  List<Object?> get props => [onMessageSeen];
}

class IsTypingReceived extends ChatEvent {
  const IsTypingReceived(this.onChatIsTyping);

  final ChatIsTyping onChatIsTyping;

  @override
  List<Object?> get props => [onChatIsTyping];
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
  List<Object?> get props => [textMessage];
}
