import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/login/bloc.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';

import 'components/form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
              accountRepository:
                  RepositoryProvider.of<AccountRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
