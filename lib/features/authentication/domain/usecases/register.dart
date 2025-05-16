import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(UserEntity user) async {
    return repository.registerRepository(user);
  }
}
