import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/account/index.dart';
import 'package:flutter_chat/data/models/chat/index.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    required this.message,
    required this.chatInfo,
    required this.account,
  });

  final Message message;
  final ChatInfo chatInfo;
  final Account account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        (message.sentByMe ? account.user.firstName : chatInfo.firstName)! + ':',
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message.sentAt.toLocal().toString()),
          message.sentByMe
              ? Icon(
                  message.isSent
                      ? message.seen
                          ? Icons.done_all
                          : Icons.done
                      : Icons.query_builder,
                )
              : Container(),
        ],
      ),
      title: Text(message.text),
    );
  }
}
