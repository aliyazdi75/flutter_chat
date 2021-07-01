import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/login/bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({required this.authenticationBloc});

  final AuthenticationBloc authenticationBloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          authenticationBloc.add(const AuthenticationStatusCheckRequested());
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final onSubmit = () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<LoginBloc>(context).add(const LoginSubmitted());
            }
          };
          return Align(
            alignment: const Alignment(0, -1 / 3),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PasswordInput(onSubmit, state),
                  const Padding(padding: EdgeInsets.all(12)),
                  _LoginButton(state.status, onSubmit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  _PasswordInput(this.onSubmit, this.state);

  final Function onSubmit;
  final LoginState state;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: (_) => onSubmit(),
      onChanged: (password) => BlocProvider.of<LoginBloc>(context)
          .add(LoginPasswordChanged(password)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) {
        if (password!.isEmpty) {
          return 'Password must not be empty';
        }
        if (state.status == LoginStatus.failure && state.error != null) {
          return state.error!.message;
        }
        return null;
      },
      decoration: const InputDecoration(labelText: 'Password'),
    );
  }
}

class _LoginButton extends StatelessWidget {
  _LoginButton(this.loginStatus, this.onSubmit);

  final LoginStatus loginStatus;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return loginStatus == LoginStatus.loading ||
            loginStatus == LoginStatus.success
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () => onSubmit(),
            child: const Text('Login'),
          );
  }
}
