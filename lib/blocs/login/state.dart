part of 'bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.password = '',
    this.error,
  });

  final LoginStatus status;
  final String password;
  final ExceptionClass? error;

  LoginState copyWith({
    LoginStatus? status,
    String? password,
    ExceptionClass? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, password];
}
