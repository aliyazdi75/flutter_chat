part of 'bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusCheckRequested extends AuthenticationEvent {
  const AuthenticationStatusCheckRequested();
}

class AuthenticationUnLoggedOutRequested extends AuthenticationEvent {}
