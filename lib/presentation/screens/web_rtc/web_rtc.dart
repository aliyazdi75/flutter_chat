import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/web_rtc/bloc.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/data/repositories/web_rtc/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';

class WebRTCPage extends StatefulWidget {
  WebRTCPage({
    @required this.userId,
    @required this.socketRepository,
    @required this.webRTCRepository,
    @required this.webRTCBloc,
  }) : assert(userId != null);

  final String userId;
  final SocketRepository socketRepository;
  final WebRTCRepository webRTCRepository;
  final WebRTCBloc webRTCBloc;

  @override
  _WebRTCPageState createState() => _WebRTCPageState();
}

class _WebRTCPageState extends State<WebRTCPage> {
  @override
  void deactivate() {
    super.deactivate();
    widget.webRTCBloc.add(CallDeactivatedRequested(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.webRTCRepository,
      child: BlocProvider.value(
        value: widget.webRTCBloc,
        child: BlocListener<WebRTCBloc, WebRTCState>(
          listener: (context, state) {
            switch (state.status) {
              case WebRTCStatus.reject:
                Navigator.of(context).pop();
                break;
              case WebRTCStatus.hangUp:
                Navigator.of(context).pop();
                break;
              case WebRTCStatus.failure:
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('WebRTC Failure')),
                  );
                break;
              default:
                break;
            }
          },
          child: BlocBuilder<WebRTCBloc, WebRTCState>(
            builder: (context, state) {
              if (state.status == WebRTCStatus.readyForCall) {
                BlocProvider.of<WebRTCBloc>(context)
                    .add(CallingRequested(widget.userId));
              } else if (state.status == WebRTCStatus.accept) {
                BlocProvider.of<WebRTCBloc>(context)
                    .add(const AnswerCallRequested());
              }
              return Scaffold(
                appBar: AppBar(title: Text(widget.userId)),
                body: state.status == WebRTCStatus.readyForCall ||
                        state.status ==
                            WebRTCStatus.videoRendersActivationLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          const Text('Remote'),
                          Expanded(
                            child: state.remoteVideoRendererActivationStatus
                                ? RTCVideoView(state.remoteVideoRender)
                                : const Center(
                                    child: CircularProgressIndicator()),
                          ),
                          const Text('Local'),
                          Expanded(
                            child: state.localVideoRendererActivationStatus
                                ? RTCVideoView(state.localVideoRender)
                                : const Center(
                                    child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
