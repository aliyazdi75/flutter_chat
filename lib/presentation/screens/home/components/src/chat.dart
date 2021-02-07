import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/chat/index.dart';

class ChatInfoWidget extends StatelessWidget {
  ChatInfoWidget({@required this.chatInfo, @required this.onTap});

  final ChatInfo chatInfo;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatInfo.firstName),
      subtitle: Text(chatInfo.lastMessage?.text ?? 'Start your first chat!'),
      leading: Text(chatInfo.newMessagesCount.toString()),
      onTap: () => onTap(),
    );
  }
}
