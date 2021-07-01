import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/data/models/response/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.email,
    required this.authenticationRepository,
  }) : super(const RegisterState());

  final String email;
  final AuthenticationRepository authenticationRepository;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterPasswordChanged) {
      yield state.copyWith(
        status: RegisterStatus.initial,
        password: event.password,
        error: null,
      );
    } else if (event is RegisterSubmitted) {
      yield* _mapLoginSubmittedToState(state);
    }
  }

  Stream<RegisterState> _mapLoginSubmittedToState(RegisterState state) async* {
    if (state.password.isEmpty) {
      yield state.copyWith(status: RegisterStatus.initial);
      return;
    }

    yield state.copyWith(status: RegisterStatus.loading);
    try {
      await authenticationRepository.register(
        email: email,
        password: state.password,
      );
      yield state.copyWith(status: RegisterStatus.success);
    } on BadRequestException catch (e) {
      final error =
          HttpExceptionModel.fromJson<RegisterBadRequestCode>(e.model);
      print('kir to requestet ba ina ${error.exceptions.first}');
      yield state.copyWith(
        status: RegisterStatus.failure,
        error: error.exceptions.first,
      );
      yield state.copyWith(status: RegisterStatus.failure);
    } on SocketException {
      print('kir to netet');
      yield state.copyWith(status: RegisterStatus.failure);
    } on Exception {
      yield state.copyWith(status: RegisterStatus.failure);
    }
  }
}
