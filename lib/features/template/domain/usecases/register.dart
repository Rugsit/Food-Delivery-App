import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/authentication/domain/entities/user.dart';
import 'package:ecommerce_project/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<Either<Failure, User>> call(User user) async {
    return repository.register(user);
  }
}
