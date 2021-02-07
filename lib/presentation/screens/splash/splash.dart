import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/presentation/screens/auth_init/auth_init.dart';
import 'package:flutter_chat/presentation/screens/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    @required this.authenticationRepository,
    @required this.accountRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => HomePage(
                  authenticationRepository: authenticationRepository,
                  accountRepository: accountRepository,
                ),
              ),
            );
            break;
          case AuthenticationStatus.unauthenticated:
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.unknown) {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(const AuthenticationStatusCheckRequested());
              }
              return state.status == AuthenticationStatus.loading
                  ? const CircularProgressIndicator()
                  : state.status == AuthenticationStatus.authenticated
                      ? Container()
                      : ElevatedButton(
                          child: const Text('Authentication Init'),
                          onPressed: () {
                            Navigator.of(context).push<void>(
                              MaterialPageRoute(
                                builder: (context) => const AuthInitPage(),
                              ),
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
