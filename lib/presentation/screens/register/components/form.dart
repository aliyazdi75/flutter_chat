import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/blocs/register/bloc.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({required this.authenticationBloc});

  final AuthenticationBloc authenticationBloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == RegisterStatus.success) {
          authenticationBloc.add(const AuthenticationStatusCheckRequested());
        } else if (state.status == RegisterStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Registration Failure')),
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          final onSubmit = () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<RegisterBloc>(context)
                  .add(const RegisterSubmitted());
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
                  _RegisterButton(onSubmit),
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
  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: true,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          onFieldSubmitted: (_) => onSubmit(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (password) => BlocProvider.of<RegisterBloc>(context)
              .add(RegisterPasswordChanged(password)),
          validator: (password) {
            if (password!.isEmpty) {
              return 'Password must not be empty';
            }
            if (state.status == RegisterStatus.failure && state.error != null) {
              return state.error!.message;
            }
            return null;
          },
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
        return state.status == RegisterStatus.loading ||
                state.status == RegisterStatus.success
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () => onSubmit(),
                child: const Text('Register'),
              );
      },
    );
  }
}
