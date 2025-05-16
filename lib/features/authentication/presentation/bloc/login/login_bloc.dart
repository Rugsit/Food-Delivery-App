import 'package:ecommerce_project/features/authentication/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part "login_event.dart";
part "login_state.dart";

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.login) : super(const LoginInitial()) {
    on<SignIn>((event, emit) => onSignInRequest(event, emit));
  }

  final LoginUseCase login;

  Future<void> onSignInRequest(SignIn event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final response = await login.call(event.email, event.password);

    response.fold(
      (left) => emit(LoginFailure(left.toString())),
      (right) => emit(LoginSuccess()),
    );
  }
}
