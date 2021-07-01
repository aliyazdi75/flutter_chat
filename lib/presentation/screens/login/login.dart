import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/login/bloc.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';

import 'components/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    required this.email,
    required this.authenticationRepository,
    required this.authenticationBloc,
  });

  final String email;
  final AuthenticationRepository authenticationRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              email: email,
              authenticationRepository: authenticationRepository,
            );
          },
          child: LoginForm(authenticationBloc: authenticationBloc),
        ),
      ),
    );
  }
}
