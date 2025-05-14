import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/usecases/register.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_event.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.register) : super(RegisterInitial()) {
    on<SignUp>(onSubmitForm);
  }

  final Register register;

  void onSubmitForm(SignUp event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    final response = await register.call(
      User(
        firstName: event.firstName,
        lastName: event.lastName,
        userName: event.userName,
        email: event.email,
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );
    response.fold(
      (left) => emit(RegisterFailure(left.toString())),
      (right) => emit(RegisterSuccess()),
    );
  }
}
