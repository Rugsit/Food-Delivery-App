import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/repositories/restaurant_detail_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchFoodByRestaurantIdUseCase {
  final RestaurantDetailRepository repository;

  FetchFoodByRestaurantIdUseCase({required this.repository});

  Future<Either<Failure, List<FoodEntity>>> call(String id) async {
    try {
      final reponse = await repository.fetchFoodByRestaurantId(id);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
