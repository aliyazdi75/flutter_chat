import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/login/bloc.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(const AuthenticationStatusCheckRequested());
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (password) => BlocProvider.of<LoginBloc>(context)
              .add(LoginPasswordChanged(password)),
          obscureText: true,
          validator: (password) =>
              password.isEmpty ? 'Password must not empty' : null,
          decoration: const InputDecoration(labelText: 'Password'),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  _LoginButton(this.formKey);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status == LoginStatus.loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(const LoginSubmitted());
                  }
                },
              );
      },
    );
  }
}
