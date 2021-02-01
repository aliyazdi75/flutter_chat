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
    this.authenticationRepository,
    this.accountRepository,
  }) : super(const AuthenticationState.unknown());

  final AuthenticationRepository authenticationRepository;
  final AccountRepository accountRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusCheckRequested) {
      yield* _mapAuthenticationStatusCheckRequestedToState();
    } else if (event is AuthenticationUnLoggedOutRequested) {
      await authenticationRepository.logout();
    } else if (event is UnAuthorizedRequested) {
      yield const AuthenticationState.unauthenticated();
    }
  }

  Stream<AuthenticationState>
      _mapAuthenticationStatusCheckRequestedToState() async* {
    assert(authenticationRepository != null && accountRepository != null);

    yield const AuthenticationState.loading();

    try {
      final account = await accountRepository.getMyUserAccount();
      if (account == null) {
        yield const AuthenticationState.unauthenticated();
      } else {
        yield AuthenticationState.authenticated(account);
      }
    } on SocketException catch (_) {
      print('kir to netet');
      yield const AuthenticationState.unauthenticated();
    } on UnauthorisedException catch (_) {
      print('kir to tokenet');
      yield const AuthenticationState.unauthenticated();
    } on NoTokenException catch (_) {
      print('kir to unsaved token');
      yield const AuthenticationState.unauthenticated();
    } on Exception catch (e) {
      debugPrintStack(label: e.toString());
      yield const AuthenticationState.unauthenticated();
    }
  }
}
