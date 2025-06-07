import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchRestaurantsByTypeUseCase {
  final RestaurantRepository repository;

  FetchRestaurantsByTypeUseCase({required this.repository});

  Future<Either<Failure, List<RestaurantEntity>>> call(String type) async {
    try {
      final reponse = await repository.fetchRestaurantByType(type);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
