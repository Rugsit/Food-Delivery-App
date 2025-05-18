import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/repositories/restaurant_detail_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchRestaurantByIdUseCase {
  final RestaurantDetailRepository repository;

  FetchRestaurantByIdUseCase({required this.repository});

  Future<Either<Failure, RestaurantDetailEntity>> call(String id) async {
    try {
      final reponse = await repository.fetchRestaurantById(id);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
