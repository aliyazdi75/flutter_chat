part of 'bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.password = '',
  });

  final RegisterStatus status;
  final String password;

  RegisterState copyWith({
    RegisterStatus status,
    String password,
  }) {
    return RegisterState(
      status: status ?? this.status,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, password];
}
