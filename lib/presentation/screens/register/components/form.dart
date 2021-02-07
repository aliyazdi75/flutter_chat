import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/login/bloc.dart';
import 'package:flutter_chat/blocs/register/bloc.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final onSubmit = () {
      if (formKey.currentState.validate()) {
        BlocProvider.of<LoginBloc>(context).add(const LoginSubmitted());
      }
    };
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          //todo: what should happen after registration
          // BlocProvider.of<AuthenticationBloc>(context)
          //     .add(const AuthenticationStatusCheckRequested());
        } else if (state.status == RegisterStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Registration Failure')),
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
              _PasswordInput(onSubmit),
              const Padding(padding: EdgeInsets.all(12)),
              _RegisterButton(onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  _PasswordInput(this.onSubmit);

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          onFieldSubmitted: (_) => onSubmit(),
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

class _RegisterButton extends StatelessWidget {
  _RegisterButton(this.onSubmit);

  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return state.status == RegisterStatus.loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                autofocus: true,
                child: const Text('Register'),
                onPressed: () => onSubmit(),
              );
      },
    );
  }
}
