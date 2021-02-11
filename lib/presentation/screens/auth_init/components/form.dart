import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/auth_init/bloc.dart';
import 'package:flutter_chat/presentation/screens/login/login.dart';
import 'package:flutter_chat/presentation/screens/register/register.dart';

class AuthInitForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final onSubmit = () {
      if (formKey.currentState.validate()) {
        BlocProvider.of<AuthInitBloc>(context).add(const AuthInitSubmitted());
      }
    };
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
              _EmailInput(onSubmit),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  _EmailInput(this.onSubmit);

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthInitBloc, AuthInitState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (_) => onSubmit(),
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
  _LoginButton(this.onSubmit);

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthInitBloc, AuthInitState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == AuthInitStatus.loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                child: const Text('Submit'),
                onPressed: () => onSubmit(),
              );
      },
    );
  }
}
