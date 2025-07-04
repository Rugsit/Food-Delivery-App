import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/home/domain/entities/category.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> fetchCategories();
}
