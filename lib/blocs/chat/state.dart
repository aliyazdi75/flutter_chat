part of 'bloc.dart';

enum ChatStatus {
  initial,
  openChatLoading,
  getMessagesLoading,
  success,
  failure,
}

class ChatState extends Equatable {
  const ChatState({
    this.status = ChatStatus.initial,
    this.lastSeen,
    this.isOnline,
    this.isTyping,
    this.messages,
  });

  final ChatStatus status;
  final DateTime lastSeen;
  final bool isOnline;
  final bool isTyping;
  final List<Message> messages;

  ChatState copyWith({
    ChatStatus status,
    List<Message> messages,
    DateTime lastSeen,
    bool isOnline,
    bool isTyping,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      lastSeen: lastSeen ?? this.lastSeen,
      isOnline: isOnline ?? this.isOnline,
      isTyping: isTyping ?? this.isTyping,
    );
  }

  @override
  List<Object> get props => [status, messages, lastSeen, isOnline, isTyping];
}
