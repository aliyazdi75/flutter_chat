part of 'bloc.dart';

@immutable
abstract class AuthInitEvent extends Equatable {
  const AuthInitEvent();

  @override
  List<Object?> get props => [];
}

class AuthInitEmailChanged extends AuthInitEvent {
  const AuthInitEmailChanged(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

class AuthInitSubmitted extends AuthInitEvent {
  const AuthInitSubmitted();
}

class AuthInitInitialStateRequested extends AuthInitEvent {
  const AuthInitInitialStateRequested();
}
