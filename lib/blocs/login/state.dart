part of 'bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.password = '',
  });

  final LoginStatus status;
  final String password;

  LoginState copyWith({
    LoginStatus status,
    String password,
  }) {
    return LoginState(
      status: status ?? this.status,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status];
}
