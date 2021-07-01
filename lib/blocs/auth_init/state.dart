part of 'bloc.dart';

enum AuthInitStatus { initial, loading, existence, nonexistence, failure }

class AuthInitState extends Equatable {
  const AuthInitState({
    this.status = AuthInitStatus.initial,
    this.email = '',
    this.error,
  });

  final AuthInitStatus status;
  final String email;
  final AuthInitBadRequest? error;

  AuthInitState copyWith({
    AuthInitStatus? status,
    String? email,
    AuthInitBadRequest? error,
  }) {
    return AuthInitState(
      status: status ?? this.status,
      email: email ?? this.email,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, email];
}
