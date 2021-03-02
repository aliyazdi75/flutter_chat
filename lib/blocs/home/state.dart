part of 'bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.chats,
  });

  final HomeStatus status;
  final List<ChatInfo> chats;

  HomeState copyWith({
    HomeStatus status,
    List<ChatInfo> chats,
  }) {
    return HomeState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
    );
  }

  @override
  List<Object> get props => [status, chats];
}
