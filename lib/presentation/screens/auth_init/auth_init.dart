import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/auth_init/bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';

import 'components/form.dart';

class AuthInitPage extends StatelessWidget {
  const AuthInitPage({
    required this.authenticationRepository,
    required this.authenticationBloc,
  });

  final AuthenticationRepository authenticationRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication Init')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return AuthInitBloc(
                authenticationRepository: authenticationRepository);
          },
          child: AuthInitForm(
            authenticationRepository: authenticationRepository,
            authenticationBloc: authenticationBloc,
          ),
        ),
      ),
    );
  }
}
