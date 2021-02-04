import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/auth_init/bloc.dart';
import 'package:flutter_chat/presentation/screens/login/login.dart';
import 'package:flutter_chat/presentation/screens/register/register.dart';

class AuthInitForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthInitBloc, AuthInitState>(
      listener: (context, state) {
        if (state.status == AuthInitStatus.existence) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => LoginPage(email: state.email),
            ),
          );
        } else if (state.status == AuthInitStatus.nonexistence) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => RegisterPage(email: state.email),
            ),
          );
        } else if (state.status == AuthInitStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Init Failure')),
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
              _EmailInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthInitBloc, AuthInitState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (email) => BlocProvider.of<AuthInitBloc>(context)
              .add(AuthInitEmailChanged(email)),
          validator: (email) => email.isEmpty ? 'Email must not empty' : null,
          decoration: const InputDecoration(labelText: 'Email'),
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
    return BlocBuilder<AuthInitBloc, AuthInitState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == AuthInitStatus.loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    BlocProvider.of<AuthInitBloc>(context)
                        .add(const AuthInitSubmitted());
                  }
                },
              );
      },
    );
  }
}
