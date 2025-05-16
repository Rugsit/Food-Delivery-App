import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/home/domain/entities/category.dart';
import 'package:ecommerce_project/features/home/domain/repositories/category_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchCategoriesUseCase {
  final CategoryRepository repository;

  FetchCategoriesUseCase({required this.repository});

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    try {
      final reponse = await repository.fetchCategories();
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
