import 'package:ecommerce_project/features/authentication/domain/entities/form_input.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_event.dart';
import 'package:ecommerce_project/features/authentication/presentation/bloc/validation/validation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ValidationFormBloc
    extends Bloc<ValidationFormEvent, ValidationFormState> {
  ValidationFormBloc() : super(const ValidationFormState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<UserNameChanged>(_onUserNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ValidateRegisterForm>(_onValidateRegisterForm);
    on<ValidateLoginForm>(_onValidateLoginForm);
    on<ResetFormStatus>(_onResetForm);
    on<ResetFormField>(_onResetFormField);
  }

  void _onFirstNameChanged(
    FirstNameChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final firstName = FirstName.dirty(event.firstName);
    emit(state.copyWith(firstName: firstName));
  }

  void _onLastNameChanged(
    LastNameChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final lastName = LastName.dirty(event.lastName);
    emit(state.copyWith(lastName: lastName));
  }

  void _onUserNameChanged(
    UserNameChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final userName = UserName.dirty(event.userName);
    emit(state.copyWith(userName: userName));
  }

  void _onEmailChanged(EmailChanged event, Emitter<ValidationFormState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(email: email));
  }

  void _onPhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(event.phoneNumber);
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(password: password));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<ValidationFormState> emit,
  ) {
    final password = ConfirmPassword.dirty(
      password: state.password.value,
      value: event.password,
    );
    emit(state.copyWith(confirmPassword: password));
  }

  void _onValidateRegisterForm(
    ValidateRegisterForm event,
    Emitter<ValidationFormState> emit,
  ) {
    final validateFirstName = FirstName.dirty(state.firstName.value);
    final validateLastName = LastName.dirty(state.lastName.value);
    final validateUserName = UserName.dirty(state.userName.value);
    final validateEmail = Email.dirty(state.email.value);
    final validatePhoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    final validatePassword = Password.dirty(state.password.value);
    final validateConfirmPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: state.confirmPassword.value,
    );

    final status = Formz.validate([
      state.firstName,
      state.lastName,
      state.userName,
      state.email,
      state.phoneNumber,
      state.password,
      state.confirmPassword,
    ]);

    emit(
      state.copyWith(
        validateStatus: status,
        firstName: validateFirstName,
        lastName: validateLastName,
        userName: validateUserName,
        email: validateEmail,
        phoneNumber: validatePhoneNumber,
        password: validatePassword,
        confirmPassword: validateConfirmPassword,
      ),
    );
  }

  void _onValidateLoginForm(
    ValidateLoginForm event,
    Emitter<ValidationFormState> emit,
  ) {
    final validateEmail = Email.dirty(state.email.value);
    final validatePassword = Password.dirty(state.password.value);

    final status = Formz.validate([state.email, state.password]);

    emit(
      state.copyWith(
        validateStatus: status,
        email: validateEmail,
        password: validatePassword,
      ),
    );
  }

  void _onResetForm(ResetFormStatus event, Emitter<ValidationFormState> emit) {
    emit(state.copyWith(validateStatus: false));
  }

  void _onResetFormField(
    ResetFormField event,
    Emitter<ValidationFormState> emit,
  ) {
    emit(
      state.copyWith(
        firstName: const FirstName.pure(),
        lastName: const LastName.pure(),
        userName: const UserName.pure(),
        email: const Email.pure(),
        phoneNumber: const PhoneNumber.pure(),
        password: const Password.pure(),
        confirmPassword: const ConfirmPassword.pure(),
        errorMessage: '',
        validateStatus: false,
      ),
    );
  }
}
