import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
  ) async {
    final response = await repository.loginRepository(email, password);
    return response.fold(
      (left) {
        return Left(left);
      },
      (right) {
        return Right(
          UserEntity(
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
}
