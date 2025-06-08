import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchRestaurantLiked {
  final RestaurantRepository repository;

  FetchRestaurantLiked({required this.repository});

  Future<Either<Failure, List<bool>>> call(
    List<String> restaurantIdList,
    String userId,
  ) async {
    try {
      final reponse = await repository.fetchRestaurantLiked(
        restaurantIdList,
        userId,
      );
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
