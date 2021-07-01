import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/models/account/index.dart';
import 'package:flutter_chat/data/repositories/account/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/services/http/index.dart';
import 'package:flutter_chat/services/shared_preferences/index.dart';

part 'event.dart';
part 'state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.authenticationRepository,
    required this.accountRepository,
  }) : super(const AuthenticationState.unknown());

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusCheckRequested) {
      yield* _mapAuthenticationStatusCheckRequestedToState();
    } else if (event is AuthenticationLoggedOutRequested) {
      yield* _mapAuthenticationLoggedOutRequestedToState();
    } else if (event is UnauthorizedRequested) {
      yield const AuthenticationState.unauthenticated();
    }
  }

  Stream<AuthenticationState>
      _mapAuthenticationStatusCheckRequestedToState() async* {
    yield const AuthenticationState.loading();

    try {
      final account = await accountRepository.getMyAccount();
      yield AuthenticationState.authenticated(account);
    } on SocketException {
      print('kir to netet');
      yield const AuthenticationState.unauthenticated();
    } on UnauthorisedException {
      print('kir to tokenet');
      yield const AuthenticationState.unauthenticated();
    } on NoTokenException {
      print('kir to unsaved token');
      yield const AuthenticationState.unauthenticated();
    } on Exception {
      yield const AuthenticationState.unauthenticated();
    }
  }

  Stream<AuthenticationState>
      _mapAuthenticationLoggedOutRequestedToState() async* {
    try {
      await authenticationRepository.logout();
      yield const AuthenticationState.unauthenticated();
    } on Exception {
      yield const AuthenticationState.unauthenticated();
    }
  }
}
