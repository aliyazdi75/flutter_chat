part of 'bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetChatListRequested extends HomeEvent {
  const GetChatListRequested();
}

class UpdateChatInfoRequested extends HomeEvent {
  const UpdateChatInfoRequested(this.chatInfo);

  final ChatInfo chatInfo;

  @override
  List<Object> get props => [chatInfo];
}
