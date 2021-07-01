part of 'bloc.dart';

enum AuthenticationStatus { unknown, loading, authenticated, unauthenticated }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.account,
  });

  final AuthenticationStatus status;
  final Account? account;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.loading()
      : this._(status: AuthenticationStatus.loading);

  const AuthenticationState.authenticated(Account account)
      : this._(status: AuthenticationStatus.authenticated, account: account);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, account];
}
