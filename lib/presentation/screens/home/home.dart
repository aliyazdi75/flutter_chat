import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/home/bloc.dart';
import 'package:flutter_chat/blocs/socket/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/data/repositories/home/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/presentation/screens/chat/chat.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: socketRepository),
        RepositoryProvider.value(value: homeRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: SocketBloc(
              authenticationRepository: authenticationRepository,
              socketRepository: socketRepository,
            ),
          ),
          BlocProvider.value(
            value: HomeBloc(
              socketRepository: socketRepository,
              homeRepository: homeRepository,
            ),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SocketBloc, SocketState>(
              listener: (context, state) async {
                switch (state.status) {
                  case SocketStatus.connect:
                    BlocProvider.of<HomeBloc>(context)
                        .add(const GetChatListRequested());
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
          ],
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Welcome to Flutter Chat ${accountRepository.account?.user?.firstName ?? 'Anonymous!'}',
              ),
            ),
            body: BlocBuilder<SocketBloc, SocketState>(
              builder: (context, state) {
                if (state.status == SocketStatus.initial) {
                  BlocProvider.of<SocketBloc>(context)
                      .add(const SocketConnectRequested());
                }
                if (state.status == SocketStatus.loading) {
                  return const Center(child: Text('Connecting to Socket...'));
                }
                if (state.status == SocketStatus.reconnect) {
                  return const Center(child: Text('Reconnecting to Socket...'));
                }
                return BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.status == HomeStatus.loading ||
                        state.status == HomeStatus.initial) {
                      return const Center(child: Text('Getting Chat List...'));
                    }
                    return state.chats.isEmpty
                        ? const Center(
                            child: Text(
                                'You don\'t have any chats or friends here :('))
                        : Column(
                            children: state.chats
                                .map(
                                  (chatInfo) => ChatInfoWidget(
                                      chatInfo: chatInfo,
                                      onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute<void>(
                                              builder: (context) => ChatPage(
                                                    socketRepository:
                                                        socketRepository,
                                                    chatInfo: chatInfo,
                                                  )))),
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
