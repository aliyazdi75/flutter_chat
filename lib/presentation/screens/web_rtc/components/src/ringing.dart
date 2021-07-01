import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/call/bloc.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';

enum RingingResponse { accept }

class RingingDialogPage extends StatelessWidget {
  RingingDialogPage({
    required this.webRTCOffer,
    required this.callBloc,
  });

  final WebRTCOffer webRTCOffer;
  final CallBloc callBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: callBloc,
      child: BlocListener<CallBloc, CallState>(
        listener: (context, state) {
          if (state.status == CallStatus.hangUp) {
            Navigator.of(context).pop();
          }
        },
        child: AlertDialog(
          title: Text(webRTCOffer.userId + ' is Ringing!'),
          content: const Text('Do you want to Answer it, or  what?'),
          actions: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pop(RingingResponse.accept),
              child: const Text('Accept'),
            ),
            ElevatedButton(
              onPressed: () => callBloc.add(EndCallRequested(
                  WebRTCHangUp((b) => b..userId = webRTCOffer.userId))),
              child: const Text('Reject'),
            ),
          ],
        ),
      ),
    );
  }
}
