import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchUserUseCase {
  final AuthRepository repository;

  FetchUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    final response = await repository.fetchUser();
    return response.fold(
      (left) {
        return Either.left(left);
      },
      (right) {
        return Either.right(right);
      },
    );
  }
}
