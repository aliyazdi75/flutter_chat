import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/register/bloc.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';

import 'components/form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
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
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return RegisterBloc(
              email: email,
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: RegisterForm(authenticationBloc: authenticationBloc),
        ),
      ),
    );
  }
}
