import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/chat/bloc.dart';
import 'package:flutter_chat/blocs/home/bloc.dart';
import 'package:flutter_chat/blocs/socket/bloc.dart';
import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/data/repositories/chat/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';

import 'components/index.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    @required this.authenticationRepository,
    @required this.socketRepository,
    @required this.chatInfo,
  });

  final AuthenticationRepository authenticationRepository;
  final SocketRepository socketRepository;
  final ChatInfo chatInfo;
  final chatRepository = ChatRepository();

  @override
  Widget build(BuildContext context) {
    final sendSubmit = () {
      BlocProvider.of<ChatBloc>(context).add(const SendChatMessageRequested());
    };
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: socketRepository),
        RepositoryProvider.value(value: chatRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: SocketBloc(
              authenticationRepository: authenticationRepository,
              socketRepository: socketRepository,
            ),
          ),
          BlocProvider<ChatBloc>.value(
            value: ChatBloc(
              socketRepository: socketRepository,
              chatInfo: chatInfo,
              chatRepository: chatRepository,
            ),
          ),
        ],
        child: BlocProvider<ChatBloc>.value(
          value: ChatBloc(
            socketRepository: socketRepository,
            chatInfo: chatInfo,
            chatRepository: chatRepository,
          ),
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
                            content:
                                Text('Failure due to connecting to socket!'),
                          ),
                        );
                      break;
                    default:
                      break;
                  }
                },
              ),
              BlocListener<ChatBloc, ChatState>(
                listener: (context, state) async {
                  switch (state.status) {
                    case ChatStatus.failure:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Failure due to getting messages!'),
                          ),
                        );
                      break;
                    default:
                      break;
                  }
                },
              ),
            ],
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state.status == ChatStatus.initial) {
                  BlocProvider.of<ChatBloc>(context)
                      .add(const OpenChatRequested());
                }
                return Scaffold(
                  appBar: AppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.chatInfo.firstName),
                        Text(
                          state.status == ChatStatus.openChatLoading
                              ? 'Getting Messages...'
                              : state.status == ChatStatus.failure
                                  ? 'Getting Messages Failed'
                                  : state.isTyping
                                      ? 'Typing...'
                                      : state.isOnline
                                          ? 'Online'
                                          : '${state.lastSeen?.toLocal() ?? 'Last Seen Recently'}',
                        ),
                      ],
                    ),
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      state.messages.isEmpty
                          ? const Center(
                              child: Text(
                                  'You don\'t have any messages with your friend here :('))
                          : ListView(
                              children: state.messages
                                  .map((message) =>
                                      MessageWidget(message: message))
                                  .toList(),
                            ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                autofocus: true,
                                onFieldSubmitted: (_) => sendSubmit(),
                                decoration:
                                    const InputDecoration(hintText: 'Message'),
                                onChanged: (textMessage) =>
                                    BlocProvider.of<ChatBloc>(context)
                                        .add(TextMessageChanged(textMessage)),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () => sendSubmit(),
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
      ),
    );
  }
}
