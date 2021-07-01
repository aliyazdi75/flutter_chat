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
    this.chatInfo,
    this.lastSeen,
    this.isOnline,
    this.isTyping,
    this.messages,
    this.textMessage = '',
  });

  final ChatStatus status;
  final ChatInfo? chatInfo;
  final DateTime? lastSeen;
  final bool? isOnline;
  final bool? isTyping;
  final List<Message?>? messages;
  final String textMessage;

  ChatState copyWith({
    ChatStatus? status,
    List<Message?>? messages,
    ChatInfo? chatInfo,
    DateTime? lastSeen,
    bool? isOnline,
    bool? isTyping,
    String? textMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      chatInfo: chatInfo ?? this.chatInfo,
      messages: messages ?? this.messages,
      lastSeen: lastSeen ?? this.lastSeen,
      isOnline: isOnline ?? this.isOnline,
      isTyping: isTyping ?? this.isTyping,
      textMessage: textMessage ?? this.textMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        lastSeen,
        isOnline,
        isTyping,
        textMessage,
      ];
}
