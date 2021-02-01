import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat/blocs/authentication/bloc.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';
import 'package:flutter_chat/data/repositories/socket/index.dart';
import 'package:flutter_chat/services/shared_preferences/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc({
    @required this.socketRepository,
    @required this.authenticationRepository,
  })  : assert(socketRepository != null),
        assert(authenticationRepository != null),
        super(const SocketState.initial());

  final SocketRepository socketRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  Stream<SocketState> mapEventToState(SocketEvent event) async* {
    if (event is SocketConnectRequested) {
      yield* _mapSocketConnectRequestedToState();
    } else if (event is SocketDisconnectRequested) {
      yield* _mapSocketDisconnectRequestedToState(state);
    }
  }

  Stream<SocketState> _mapSocketConnectRequestedToState() async* {
    yield const SocketState.loading();

    try {
      final credit = await authenticationRepository.getCredit();
      await socketRepository.connect(
        token: credit.token,
        onReconnecting: () async* {
          yield const SocketState.reconnect();
        },
        onReconnected: () async* {
          yield const SocketState.connect();
        },
      );
      yield const SocketState.connect();
    } on NoTokenException catch (_) {
      print('kir to unsaved token');
      AuthenticationBloc().add(const UnAuthorizedRequested());
    } on Exception catch (_) {
      AuthenticationBloc().add(const UnAuthorizedRequested());
      yield const SocketState.failure();
    }
  }

  Stream<SocketState> _mapSocketDisconnectRequestedToState(
      SocketState state) async* {
    if (state.status != SocketStatus.connect) {
      return;
    }
    await socketRepository.disconnect();
    yield const SocketState.disconnect();
  }
}
