import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/call/bloc.dart';
import 'package:flutter_chat/blocs/web_rtc/bloc.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/repositories/call/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/data/repositories/web_rtc/index.dart';
import 'package:flutter_chat/services/web_rtc/index.dart';

class WebRTCPage extends StatelessWidget {
  WebRTCPage({
    required this.userId,
    required this.socketRepository,
    required this.callRepository,
    required this.callBloc,
  });

  final String userId;
  final SocketRepository socketRepository;
  final CallRepository callRepository;
  final CallBloc callBloc;

  final webRTCRepository = WebRTCRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: callRepository,
        ),
        RepositoryProvider(
          create: (_) => webRTCRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => WebRTCBloc(
          userId: userId,
          socketRepository: socketRepository,
          callRepository: callRepository,
          webRTCRepository: webRTCRepository,
          callBloc: callBloc,
        ),
        child: BlocListener<WebRTCBloc, WebRTCState>(
          listener: (context, state) {
            switch (state.status) {
              case WebRTCStatus.hangUp:
                Navigator.of(context).pop();
                break;
              case WebRTCStatus.reject:
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
              if (state.status == WebRTCStatus.initial) {
                if (callRepository.webRTCOffer != null) {
                  BlocProvider.of<WebRTCBloc>(context)
                      .add(AnswerCallRequested(callRepository.webRTCOffer!));
                } else {
                  BlocProvider.of<WebRTCBloc>(context).add(RequestCall(userId));
                }
              }
              return Scaffold(
                appBar: AppBar(title: Text(userId)),
                body: state.status == WebRTCStatus.initial ||
                        state.status ==
                            WebRTCStatus.videoRendersActivationLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          const Text('Remote'),
                          Expanded(
                            child: state.remoteVideoRendererActivationStatus
                                ? RTCVideoView(state.remoteVideoRender!)
                                : const Center(
                                    child: CircularProgressIndicator()),
                          ),
                          const Text('Local'),
                          Expanded(
                            child: state.localVideoRendererActivationStatus
                                ? RTCVideoView(state.localVideoRender!)
                                : const Center(
                                    child: CircularProgressIndicator()),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.call_end),
                                onPressed: () =>
                                    BlocProvider.of<WebRTCBloc>(context).add(
                                        HangUpCallRequested(WebRTCHangUp(
                                            (b) => b..userId = userId))),
                              ),
                              if (state.hasTorch)
                                IconButton(
                                  icon: Icon(
                                    state.torchStatus
                                        ? Icons.flash_on
                                        : Icons.flash_off,
                                  ),
                                  onPressed: () =>
                                      BlocProvider.of<WebRTCBloc>(context)
                                          .add(const ToggleTorchRequested()),
                                ),
                              IconButton(
                                icon: const Icon(Icons.flip_camera_ios),
                                onPressed: () =>
                                    BlocProvider.of<WebRTCBloc>(context)
                                        .add(const SwitchCameraRequested()),
                              ),
                              IconButton(
                                icon: Icon(
                                  state.localVideoRendererActivationStatus
                                      ? Icons.camera_alt
                                      : Icons.camera_alt_outlined,
                                ),
                                onPressed: () =>
                                    BlocProvider.of<WebRTCBloc>(context).add(
                                        const ToggleLocalVideoRenderActivationRequested()),
                              ),
                              IconButton(
                                icon: Icon(
                                  state.micMuteStatus
                                      ? Icons.mic_off
                                      : Icons.mic,
                                ),
                                onPressed: () =>
                                    BlocProvider.of<WebRTCBloc>(context).add(
                                        const ToggleMicActivationRequested()),
                              ),
                            ],
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
