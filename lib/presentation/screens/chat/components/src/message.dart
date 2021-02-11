import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/chat/index.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({@required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.text),
    );
  }
}
