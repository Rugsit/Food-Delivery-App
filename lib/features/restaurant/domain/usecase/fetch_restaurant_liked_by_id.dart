import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchRestaurantLikedByIdUseCase {
  final RestaurantRepository repository;

  FetchRestaurantLikedByIdUseCase({required this.repository});

  Future<Either<Failure, LikeEntity?>> call(
    String restaurantId,
    String userId,
  ) async {
    try {
      final reponse = await repository.fetchRestaurantLikedById(
        restaurantId,
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
