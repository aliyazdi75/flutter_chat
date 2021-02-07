import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/chat/index.dart';

class ChatInfoWidget extends StatelessWidget {
  ChatInfoWidget({@required this.chatInfo});

  final ChatInfo chatInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatInfo.firstName),
      subtitle: Text(chatInfo.lastMessage?.text ?? 'Start your first chat!'),
      leading: Text(chatInfo.newMessagesCount.toString()),
    );
  }
}
