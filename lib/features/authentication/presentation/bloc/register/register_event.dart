import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class SignUp extends RegisterEvent {
  SignUp({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  @override
  List<Object?> get props => [
    firstName,
    lastName,
    userName,
    email,
    phoneNumber,
    password,
  ];
}
