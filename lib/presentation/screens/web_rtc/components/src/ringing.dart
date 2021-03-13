import 'package:flutter/material.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';

enum RingingResponse { accept, reject }

class RingingDialogPage extends StatelessWidget {
  RingingDialogPage({
    @required this.webRTCOffer,
  }) : assert(webRTCOffer != null);

  final WebRTCOffer webRTCOffer;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(webRTCOffer.userId + ' is Ringing!'),
      content: const Text('Do you want to Answer it, or  what?'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(RingingResponse.accept),
          child: const Text('Accept'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(RingingResponse.reject),
          child: const Text('Reject'),
        ),
      ],
    );
  }
}
