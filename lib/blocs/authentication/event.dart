part of 'bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationStatusCheckRequested extends AuthenticationEvent {
  const AuthenticationStatusCheckRequested();
}

class AuthenticationLoggedOutRequested extends AuthenticationEvent {
  const AuthenticationLoggedOutRequested();
}

class UnauthorizedRequested extends AuthenticationEvent {
  const UnauthorizedRequested();
}
