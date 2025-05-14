import 'package:equatable/equatable.dart';

sealed class ValidationFormEvent extends Equatable {
  const ValidationFormEvent();
}

class FirstNameChanged extends ValidationFormEvent {
  const FirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends ValidationFormEvent {
  const LastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class UserNameChanged extends ValidationFormEvent {
  const UserNameChanged(this.userName);

  final String userName;

  @override
  List<Object> get props => [userName];
}

class EmailChanged extends ValidationFormEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PhoneNumberChanged extends ValidationFormEvent {
  const PhoneNumberChanged(this.phoneNumber);

  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class PasswordChanged extends ValidationFormEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends ValidationFormEvent {
  const ConfirmPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterFormSubmitted extends ValidationFormEvent {
  @override
  List<Object> get props => [];
}

class ValidateRegisterForm extends ValidationFormEvent {
  const ValidateRegisterForm();

  @override
  List<Object> get props => [];
}

class ValidateLoginForm extends ValidationFormEvent {
  const ValidateLoginForm();

  @override
  List<Object> get props => [];
}

class ResetFormStatus extends ValidationFormEvent {
  const ResetFormStatus();

  @override
  List<Object> get props => [];
}

class ResetFormField extends ValidationFormEvent {
  const ResetFormField();

  @override
  List<Object> get props => [];
}
