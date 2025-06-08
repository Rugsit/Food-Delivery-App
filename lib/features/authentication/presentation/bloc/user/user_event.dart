part of "user_bloc.dart";

sealed class UserEvent extends Equatable {
  const UserEvent();
}

final class GetUser extends UserEvent {
  const GetUser();

  @override
  List<Object> get props => [];
}
