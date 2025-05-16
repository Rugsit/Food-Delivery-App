import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json["firstName"],
      lastName: json["lastName"],
      userName: json["userName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userName": userName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
  }
}
