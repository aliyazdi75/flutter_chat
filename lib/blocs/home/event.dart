part of 'bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoggedOutRequested extends HomeEvent {
  const LoggedOutRequested();
}

class GetChatListRequested extends HomeEvent {
  const GetChatListRequested();
}

class StatusChanged extends HomeEvent {
  const StatusChanged(this.onStatusChanged);

  final ChatStatusChange onStatusChanged;

  @override
  List<Object?> get props => [onStatusChanged];
}

class MessageReceived extends HomeEvent {
  const MessageReceived(this.onChatMessageReceived);

  final ChatMessageReceive onChatMessageReceived;

  @override
  List<Object?> get props => [onChatMessageReceived];
}

class ChatSeenReceived extends HomeEvent {
  const ChatSeenReceived(this.onMessageSeen);

  final ChatSeen onMessageSeen;

  @override
  List<Object?> get props => [onMessageSeen];
}

class IsTypingReceived extends HomeEvent {
  const IsTypingReceived(this.onChatIsTyping);

  final ChatIsTyping onChatIsTyping;

  @override
  List<Object?> get props => [onChatIsTyping];
}

class UpdateChatInfoRequested extends HomeEvent {
  const UpdateChatInfoRequested(this.chatInfo);

  final ChatInfo chatInfo;

  @override
  List<Object?> get props => [chatInfo];
}

class UpdateNewMessageCountRequested extends HomeEvent {
  const UpdateNewMessageCountRequested(this.chatInfo);

  final ChatInfo chatInfo;

  @override
  List<Object?> get props => [chatInfo];
}
