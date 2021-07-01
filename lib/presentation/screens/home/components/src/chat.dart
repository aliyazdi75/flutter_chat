import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/chat/index.dart';

class ChatInfoWidget extends StatelessWidget {
  ChatInfoWidget({required this.chatInfo, required this.onTap});

  final ChatInfo chatInfo;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.online_prediction_outlined,
        color: chatInfo.isOnline ? Colors.green : null,
      ),
      title: Text(chatInfo.firstName),
      subtitle: Text(
        chatInfo.isTyping
            ? 'Typing...'
            : chatInfo.lastMessage?.text ?? 'Start your first chat!',
      ),
      trailing: chatInfo.lastMessage == null
          ? null
          : chatInfo.lastMessage!.sentByMe
              ? Icon(
                  chatInfo.lastMessage!.isSent
                      ? chatInfo.lastMessage!.seen
                          ? Icons.done_all
                          : Icons.done
                      : Icons.query_builder,
                )
              : Text(
                  chatInfo.newMessagesCount.toString(),
                  style: TextStyle(
                      color:
                          chatInfo.newMessagesCount == 0 ? null : Colors.red),
                ),
      onTap: () => onTap(),
    );
  }
}
