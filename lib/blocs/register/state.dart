part of 'bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.initial,
    this.password = '',
    this.error,
  });

  final RegisterStatus status;
  final String password;
  final ExceptionClass? error;

  RegisterState copyWith({
    RegisterStatus? status,
    String? password,
    ExceptionClass? error,
  }) {
    return RegisterState(
      status: status ?? this.status,
      password: password ?? this.password,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, password];
}
