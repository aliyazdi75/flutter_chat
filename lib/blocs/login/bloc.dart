import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.email,
    @required this.authenticationRepository,
  })  : assert(email != null),
        assert(authenticationRepository != null),
        super(const LoginState());

  final String email;
  final AuthenticationRepository authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(state);
    }
  }

  Stream<LoginState> _mapLoginSubmittedToState(LoginState state) async* {
    if (state.password.isEmpty) {
      yield state.copyWith(status: LoginStatus.initial);
      return;
    }

    yield state.copyWith(status: LoginStatus.loading);
    try {
      await authenticationRepository.login(
        email: email,
        password: state.password,
      );
      yield state.copyWith(status: LoginStatus.success);
    } on BadRequestException {
      // final error = e.model as LoginBadRequest;
      // print(
      //     'kir to requestet ba ina ${error.email ?? error.password ?? error.nonFieldErrors}');
      yield state.copyWith(status: LoginStatus.failure);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: LoginStatus.failure);
    } on Exception {
      yield state.copyWith(status: LoginStatus.failure);
    }
  }
}
