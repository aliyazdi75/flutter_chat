import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/web_rtc/bloc.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';

enum RingingResponse { accept, reject }

class RingingDialogPage extends StatelessWidget {
  RingingDialogPage({
    @required this.webRTCOffer,
    @required this.webRTCBloc,
  }) : assert(webRTCOffer != null);

  final WebRTCOffer webRTCOffer;
  final WebRTCBloc webRTCBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: webRTCBloc,
      child: BlocListener<WebRTCBloc, WebRTCState>(
        listener: (context, state) {
          if (state.status == WebRTCStatus.hangUp &&
              state.webRTCHangUp.userId == webRTCOffer.userId) {
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
              onPressed: () =>
                  Navigator.of(context).pop(RingingResponse.reject),
              child: const Text('Reject'),
            ),
          ],
        ),
      ),
    );
  }
}
