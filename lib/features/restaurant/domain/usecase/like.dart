import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikeUseCase {
  final RestaurantRepository repository;

  LikeUseCase({required this.repository});

  Future<Either<Failure, LikeEntity>> call(
    String userId,
    String restaurantId,
  ) async {
    try {
      final reponse = await repository.like(userId, restaurantId);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(InsertFailure(errorMessage: e.toString()));
    }
  }
}
