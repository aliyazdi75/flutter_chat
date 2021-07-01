part of 'bloc.dart';

enum SocketStatus {
  initial,
  loading,
  connect,
  reconnect,
  disconnect,
  failure,
}

class SocketState extends Equatable {
  const SocketState._({this.status = SocketStatus.initial});

  final SocketStatus status;

  const SocketState.initial() : this._();

  const SocketState.loading() : this._(status: SocketStatus.loading);

  const SocketState.connect() : this._(status: SocketStatus.connect);

  const SocketState.reconnect() : this._(status: SocketStatus.reconnect);

  const SocketState.disconnect() : this._(status: SocketStatus.disconnect);

  const SocketState.failure() : this._(status: SocketStatus.failure);

  @override
  List<Object?> get props => [status];
}
