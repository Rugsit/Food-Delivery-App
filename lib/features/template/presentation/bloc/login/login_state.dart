part of "login_bloc.dart";

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

final class LoginLoading extends LoginState {
  const LoginLoading();

  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  const LoginSuccess();

  @override
  List<Object> get props => [];
}

final class LoginFailure extends LoginState {
  const LoginFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
