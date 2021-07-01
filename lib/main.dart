import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/presentation/screens/home/home.dart';
import 'package:flutter_chat/presentation/screens/splash/splash.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.dumpErrorToConsole(details);
  };
  //todo: remove this when we have certification
  HttpOverrides.global = MyHttpOverrides();
  runApp(FlutterChat());
}

//todo: remove this when we have certification
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  }
}

class FlutterChat extends StatelessWidget {
  final authenticationRepository = AuthenticationRepository();
  final accountRepository = AccountRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => authenticationRepository),
          RepositoryProvider(create: (_) => accountRepository),
        ],
        child: BlocProvider(
          create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            accountRepository: accountRepository,
          ),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  break;
                default:
                  break;
              }
            },
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state.status == AuthenticationStatus.authenticated) {
                  return HomePage(
                    authenticationRepository: authenticationRepository,
                    accountRepository: accountRepository,
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                  );
                }
                return SplashPage(
                  authenticationRepository: authenticationRepository,
                  accountRepository: accountRepository,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
