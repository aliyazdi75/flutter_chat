import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/call/bloc.dart';
import 'package:flutter_chat/blocs/home/bloc.dart';
import 'package:flutter_chat/blocs/socket/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/data/repositories/call/index.dart';
import 'package:flutter_chat/data/repositories/home/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/presentation/screens/chat/chat.dart';
import 'package:flutter_chat/presentation/screens/web_rtc/components/index.dart';
import 'package:flutter_chat/presentation/screens/web_rtc/web_rtc.dart';

import 'components/index.dart';

class HomePage extends StatelessWidget {
  HomePage({
    required this.authenticationRepository,
    required this.accountRepository,
    required this.authenticationBloc,
  });

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;
  final AuthenticationBloc authenticationBloc;

  final socketRepository = SocketRepository();
  final homeRepository = HomeRepository();
  final callRepository = CallRepository();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => socketRepository),
        RepositoryProvider(create: (_) => homeRepository),
        RepositoryProvider(create: (_) => callRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SocketBloc>(
            create: (_) => SocketBloc(
              authenticationRepository: authenticationRepository,
              socketRepository: socketRepository,
              authenticationBloc: authenticationBloc,
            )..add(const SocketConnectRequested()),
          ),
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(
              socketRepository: socketRepository,
              homeRepository: homeRepository,
              authenticationBloc: authenticationBloc,
            ),
          ),
          BlocProvider<CallBloc>(
            create: (_) => CallBloc(
              socketRepository: socketRepository,
              callRepository: callRepository,
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
                      if (BlocProvider.of<CallBloc>(context).state.status ==
                          CallStatus.initial) {
                        BlocProvider.of<CallBloc>(context)
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
            BlocListener<CallBloc, CallState>(
              listener: (context, state) async {
                switch (state.status) {
                  case CallStatus.ringing:
                    final ringingResponse = await showDialog<RingingResponse>(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => RingingDialogPage(
                        webRTCOffer: state.webRTCOffer!,
                        callBloc: BlocProvider.of<CallBloc>(context),
                      ),
                    );
                    if (ringingResponse == RingingResponse.accept) {
                      BlocProvider.of<CallBloc>(context)
                          .add(const CallAcceptRequested());
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (_) => WebRTCPage(
                            userId: state.webRTCOffer!.userId,
                            socketRepository: socketRepository,
                            callRepository: callRepository,
                            callBloc: BlocProvider.of<CallBloc>(context),
                          ),
                        ),
                      );
                    }
                    break;
                  case CallStatus.hangUp:
                    BlocProvider.of<CallBloc>(context)
                        .add(const ReadyForCallRequested());
                    break;
                  default:
                    break;
                }
              },
            ),
          ],
          child: BlocBuilder<SocketBloc, SocketState>(
            builder: (context, socketState) {
              return BlocBuilder<HomeBloc, HomeState>(
                builder: (context, homeState) {
                  return Scaffold(
                    appBar: AppBar(
                      actions: [
                        BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, homeState) => IconButton(
                            icon: homeState.status == HomeStatus.logOutLoading
                                ? const CircularProgressIndicator(
                                    backgroundColor: Colors.white)
                                : const Icon(Icons.logout),
                            onPressed: () => BlocProvider.of<HomeBloc>(context)
                                .add(const LoggedOutRequested()),
                          ),
                        ),
                      ],
                      title: Text(
                        'Welcome to Flutter Chat ${accountRepository.account?.user.firstName ?? 'Anonymous!'}',
                      ),
                    ),
                    body: Builder(builder: (context) {
                      if (socketState.status == SocketStatus.loading) {
                        return const Center(
                            child: Text('Connecting to Socket...'));
                      }
                      if (socketState.status == SocketStatus.reconnect) {
                        return const Center(
                            child: Text('Reconnecting to Socket...'));
                      }
                      if (homeState.status == HomeStatus.loading ||
                          homeState.status == HomeStatus.initial) {
                        return const Center(
                            child: Text('Getting Chat List...'));
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
                                            accountRepository:
                                                accountRepository,
                                            socketRepository: socketRepository,
                                            callRepository: callRepository,
                                            authenticationBloc:
                                                authenticationBloc,
                                            socketBloc:
                                                BlocProvider.of<SocketBloc>(
                                                    context),
                                            homeBloc: BlocProvider.of<HomeBloc>(
                                                context),
                                            callBloc: BlocProvider.of<CallBloc>(
                                                context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                    }),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
