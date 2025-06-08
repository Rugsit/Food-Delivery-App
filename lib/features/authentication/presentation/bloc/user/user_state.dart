part of "user_bloc.dart";

sealed class UserState extends Equatable {
  const UserState();
}

final class UserInitial extends UserState {
  const UserInitial();

  @override
  List<Object> get props => [];
}

final class UserLoading extends UserState {
  const UserLoading();

  @override
  List<Object> get props => [];
}

final class UserSuccess extends UserState {
  const UserSuccess({required this.user});

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

final class UserFailure extends UserState {
  const UserFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
