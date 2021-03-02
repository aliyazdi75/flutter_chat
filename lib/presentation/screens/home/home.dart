import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/home/bloc.dart';
import 'package:flutter_chat/blocs/socket/bloc.dart';
import 'package:flutter_chat/blocs/web_rtc/bloc.dart';
import 'package:flutter_chat/data/models/web_rtc/index.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/data/repositories/home/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/data/repositories/web_rtc/index.dart';
import 'package:flutter_chat/presentation/screens/chat/chat.dart';
import 'package:flutter_chat/presentation/screens/web_rtc/components/index.dart';
import 'package:flutter_chat/presentation/screens/web_rtc/web_rtc.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  HomePage({
    @required this.authenticationRepository,
    @required this.accountRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  final socketRepository = SocketRepository();
  final homeRepository = HomeRepository();
  final webRTCRepository = WebRTCRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => socketRepository),
        RepositoryProvider(create: (_) => homeRepository),
        RepositoryProvider(create: (_) => webRTCRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SocketBloc>(
            create: (_) => SocketBloc(
              authenticationRepository: authenticationRepository,
              socketRepository: socketRepository,
            )..add(const SocketConnectRequested()),
          ),
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(
              socketRepository: socketRepository,
              homeRepository: homeRepository,
            ),
          ),
          BlocProvider<WebRTCBloc>(
            create: (_) => WebRTCBloc(
              socketRepository: socketRepository,
              webRTCRepository: webRTCRepository,
            ),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SocketBloc, SocketState>(
              listener: (context, state) async {
                switch (state.status) {
                  case SocketStatus.connect:
                    {
                      if (BlocProvider.of<HomeBloc>(context).state.status ==
                          HomeStatus.initial) {
                        BlocProvider.of<HomeBloc>(context)
                            .add(const GetChatListRequested());
                      }
                      //Listen to new video calls
                      if (BlocProvider.of<WebRTCBloc>(context).state.status ==
                          WebRTCStatus.initial) {
                        BlocProvider.of<WebRTCBloc>(context)
                            .add(const ReadyForCallRequested());
                      }
                    }
                    break;
                  case SocketStatus.disconnect:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Socket has been disconnected!'),
                        ),
                      );
                    break;
                  case SocketStatus.failure:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Failure due to connecting to socket!'),
                        ),
                      );
                    break;
                  default:
                    break;
                }
              },
            ),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) async {
                switch (state.status) {
                  case HomeStatus.failure:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Failure due to getting chat list!'),
                        ),
                      );
                    break;
                  default:
                    break;
                }
              },
            ),
            BlocListener<WebRTCBloc, WebRTCState>(
              listener: (context, state) async {
                switch (state.status) {
                  case WebRTCStatus.callReceivedRinging:
                    final ringingResponse = await showDialog<RingingResponse>(
                      context: context,
                      builder: (_) => RingingDialogPage(
                        webRTCOffer: state.webRTCOffer,
                        webRTCBloc: BlocProvider.of<WebRTCBloc>(context),
                      ),
                    );
                    if (ringingResponse == RingingResponse.accept) {
                      BlocProvider.of<WebRTCBloc>(context)
                          .add(const CallAcceptRequested());
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) => WebRTCPage(
                            userId: state.webRTCOffer.userId,
                            socketRepository: socketRepository,
                            webRTCRepository: webRTCRepository,
                            webRTCBloc: BlocProvider.of<WebRTCBloc>(context),
                          ),
                        ),
                      );
                    } else if (ringingResponse == RingingResponse.reject) {
                      BlocProvider.of<WebRTCBloc>(context).add(
                          RejectCallRequested(WebRTCReject(
                              (b) => b..userId = state.webRTCOffer.userId)));
                    }
                    break;
                  case WebRTCStatus.failure:
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Failure due to getting video chat!'),
                        ),
                      );
                    break;
                  default:
                    break;
                }
              },
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Welcome to Flutter Chat ${accountRepository.account?.user?.firstName ?? 'Anonymous!'}',
              ),
            ),
            body: BlocBuilder<SocketBloc, SocketState>(
              builder: (context, state) {
                if (state.status == SocketStatus.loading) {
                  return const Center(child: Text('Connecting to Socket...'));
                }
                if (state.status == SocketStatus.reconnect) {
                  return const Center(child: Text('Reconnecting to Socket...'));
                }
                return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, homeState) {
                    if (homeState.status == HomeStatus.loading ||
                        homeState.status == HomeStatus.initial) {
                      return const Center(child: Text('Getting Chat List...'));
                    }
                    return homeState.chats.isEmpty
                        ? const Center(
                            child: Text(
                                'You don\'t have any chats or friends here :('))
                        : ListView(
                            children: homeState.chats
                                .map(
                                  (chatInfo) => ChatInfoWidget(
                                    chatInfo: chatInfo,
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) => ChatPage(
                                          chatInfo: chatInfo,
                                          authenticationRepository:
                                              authenticationRepository,
                                          accountRepository: accountRepository,
                                          socketRepository: socketRepository,
                                          webRTCRepository: webRTCRepository,
                                          socketBloc:
                                              BlocProvider.of<SocketBloc>(
                                                  context),
                                          webRTCBloc:
                                              BlocProvider.of<WebRTCBloc>(
                                                  context),
                                          homeBloc: BlocProvider.of<HomeBloc>(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
