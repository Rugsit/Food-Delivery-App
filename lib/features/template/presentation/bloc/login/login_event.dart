part of "login_bloc.dart";

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class SignIn extends LoginEvent {
  const SignIn(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object> get props => [];
}
