import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginRepository(
    String email,
    String password,
  );
  Future<void> logout();
  Future<Either<Failure, UserEntity>> registerRepository(UserEntity user);
  Future<Either<Failure, UserEntity>> fetchUser();
}
