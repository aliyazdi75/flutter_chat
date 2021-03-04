part of 'bloc.dart';

enum AuthInitStatus { initial, loading, existence, nonexistence, failure }

class AuthInitState extends Equatable {
  const AuthInitState({
    this.status = AuthInitStatus.initial,
    this.email = '',
  });

  final AuthInitStatus status;
  final String email;

  AuthInitState copyWith({
    AuthInitStatus status,
    String email,
  }) {
    return AuthInitState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [status, email];
}
