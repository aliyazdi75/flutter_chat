part of 'bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.initial,
    this.chats = const <ChatInfo>[],
  });

  final HomeStatus status;
  final List<ChatInfo> chats;

  const HomeState.initial() : this._();

  const HomeState.loading() : this._(status: HomeStatus.loading);

  const HomeState.success(List<ChatInfo> chats)
      : this._(status: HomeStatus.success, chats: chats);

  const HomeState.failure() : this._(status: HomeStatus.failure);

  @override
  List<Object> get props => [status, chats];
}
