import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/auth_init/bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/presentation/screens/login/login.dart';
import 'package:flutter_chat/presentation/screens/register/register.dart';

class AuthInitForm extends StatelessWidget {
  AuthInitForm({
    required this.authenticationRepository,
    required this.authenticationBloc,
  });

  final AuthenticationRepository authenticationRepository;
  final AuthenticationBloc authenticationBloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthInitBloc, AuthInitState>(
      listener: (context, state) {
        if (state.status == AuthInitStatus.existence) {
          BlocProvider.of<AuthInitBloc>(context)
              .add(const AuthInitInitialStateRequested());
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => LoginPage(
                email: state.email,
                authenticationRepository: authenticationRepository,
                authenticationBloc: authenticationBloc,
              ),
            ),
          );
        } else if (state.status == AuthInitStatus.nonexistence) {
          BlocProvider.of<AuthInitBloc>(context)
              .add(const AuthInitInitialStateRequested());
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => RegisterPage(
                email: state.email,
                authenticationRepository: authenticationRepository,
                authenticationBloc: authenticationBloc,
              ),
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
      child: BlocBuilder<AuthInitBloc, AuthInitState>(
        builder: (context, state) {
          final onSubmit = () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthInitBloc>(context)
                  .add(const AuthInitSubmitted());
            }
          };
          return Align(
            alignment: const Alignment(0, -1 / 3),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _EmailInput(onSubmit, state),
                  const Padding(padding: EdgeInsets.all(12)),
                  _SubmitButton(state.status, onSubmit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  _EmailInput(this.onSubmit, this.state);

  final Function onSubmit;
  final AuthInitState state;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: (_) => onSubmit(),
      onChanged: (email) => BlocProvider.of<AuthInitBloc>(context)
          .add(AuthInitEmailChanged(email)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) {
        if (email!.isEmpty) {
          return 'Email must not be empty';
        }
        if (state.status == AuthInitStatus.failure && state.error != null) {
          return state.error!.email!.first.message;
        }
        return null;
      },
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton(this.authInitStatus, this.onSubmit);

  final AuthInitStatus authInitStatus;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return authInitStatus == AuthInitStatus.loading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () => onSubmit(),
            child: const Text('Submit'),
          );
  }
}
