import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/data/datasources/auth_remote.dart';
import 'package:ecommerce_project/features/authentication/data/models/user.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.authRemoteDatasource);
  final AuthRemoteDatasource authRemoteDatasource;

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    final response = await authRemoteDatasource.login(email, password);
    return response.fold(
      (left) {
        return Either.left(left);
      },
      (right) {
        return Either.right(
          User(
            firstName: right.firstName,
            lastName: right.lastName,
            userName: right.userName,
            phoneNumber: right.phoneNumber,
            password: right.password,
            email: right.email,
          ),
        );
      },
    );
  }

  @override
  Future<Either<Failure, User>> register(User user) async {
    final dataUserModel = UserModel(
      firstName: user.firstName,
      lastName: user.lastName,
      userName: user.userName,
      phoneNumber: user.phoneNumber,
      password: user.password,
      email: user.email,
    );
    final result = await authRemoteDatasource.register(dataUserModel);
    return result.fold(
      (left) {
        return Either.left(left);
      },
      (right) {
        return Either.right(
          User(
            firstName: right.firstName,
            lastName: right.lastName,
            userName: right.userName,
            phoneNumber: right.phoneNumber,
            password: right.password,
            email: right.email,
          ),
        );
      },
    );
  }

  @override
  Future<void> logout() async {
    print("Logout...");
  }
}
