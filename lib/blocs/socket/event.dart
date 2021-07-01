part of 'bloc.dart';

@immutable
abstract class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object?> get props => [];
}

class SocketConnectRequested extends SocketEvent {
  const SocketConnectRequested();
}

class SocketDisconnectRequested extends SocketEvent {
  const SocketDisconnectRequested();
}
