import 'package:ecommerce_project/features/authentication/domain/entities/form_input.dart';

class ValidationFormState {
  const ValidationFormState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.userName = const UserName.pure(),
    this.email = const Email.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.validateStatus = false,
    this.errorMessage = '',
  });

  final FirstName firstName;
  final LastName lastName;
  final UserName userName;
  final Email email;
  final PhoneNumber phoneNumber;
  final Password password;
  final ConfirmPassword confirmPassword;
  final bool validateStatus;
  final String errorMessage;

  ValidationFormState copyWith({
    FirstName? firstName,
    LastName? lastName,
    UserName? userName,
    Email? email,
    PhoneNumber? phoneNumber,
    ConfirmPassword? confirmPassword,
    Password? password,
    bool? validateStatus,
    String? errorMessage,
  }) {
    return ValidationFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      validateStatus: validateStatus ?? this.validateStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
