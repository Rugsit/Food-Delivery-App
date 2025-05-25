import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/repositories/restaurant_detail_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchRestaurantLiked {
  final RestaurantDetailRepository repository;

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
