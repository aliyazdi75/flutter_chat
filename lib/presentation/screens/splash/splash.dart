import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/presentation/screens/auth_init/auth_init.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    required this.authenticationRepository,
    required this.accountRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(const AuthenticationStatusCheckRequested());
        }
        return Scaffold(
          body: Center(
            child: state.status == AuthenticationStatus.loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (_) => AuthInitPage(
                            authenticationRepository: authenticationRepository,
                            authenticationBloc:
                                BlocProvider.of<AuthenticationBloc>(context),
                          ),
                        ),
                      );
                    },
                    child: const Text('Authentication Init'),
                  ),
          ),
        );
      },
    );
  }
}
