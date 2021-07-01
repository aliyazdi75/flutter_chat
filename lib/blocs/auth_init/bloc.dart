import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/response/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class AuthInitBloc extends Bloc<AuthInitEvent, AuthInitState> {
  AuthInitBloc({
    required this.authenticationRepository,
  }) : super(const AuthInitState());

  final AuthenticationRepository authenticationRepository;

  @override
  Stream<AuthInitState> mapEventToState(AuthInitEvent event) async* {
    if (event is AuthInitEmailChanged) {
      yield state.copyWith(
        status: AuthInitStatus.initial,
        email: event.email,
        error: null,
      );
    } else if (event is AuthInitSubmitted) {
      yield* _mapLoginSubmittedToState(state);
    } else if (event is AuthInitInitialStateRequested) {
      yield state.copyWith(status: AuthInitStatus.initial);
    }
  }

  Stream<AuthInitState> _mapLoginSubmittedToState(AuthInitState state) async* {
    if (state.email.isEmpty) {
      yield state.copyWith(status: AuthInitStatus.initial);
      return;
    }

    yield state.copyWith(status: AuthInitStatus.loading);
    try {
      final authInit = await authenticationRepository.init(email: state.email);
      yield state.copyWith(
        status: authInit.exists
            ? AuthInitStatus.existence
            : AuthInitStatus.nonexistence,
      );
    } on BadRequestException catch (e) {
      final error = HttpExceptionModel.fromJson<AuthInitBadRequest>(e.model);
      print('kir to requestet ba ina ${error.exceptions.first.errors!.email}');
      yield state.copyWith(
        status: AuthInitStatus.failure,
        error: error.exceptions.first.errors,
      );
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: AuthInitStatus.failure);
    } on Exception catch (e) {
      print(e.toString());
      yield state.copyWith(status: AuthInitStatus.failure);
    }
  }
}
