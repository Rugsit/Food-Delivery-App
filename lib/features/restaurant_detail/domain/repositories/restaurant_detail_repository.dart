import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:fpdart/fpdart.dart';

abstract class RestaurantDetailRepository {
  Future<Either<Failure, RestaurantDetailEntity>> fetchRestaurantById(
    String id,
  );
  Future<Either<Failure, List<FoodEntity>>> fetchFoodByRestaurantId(
    String restaurantId,
  );

  Future<Either<Failure, LikeEntity>> like(String restaurantId, String userId);
  Future<Either<Failure, LikeEntity>> unlike(
    String restaurantId,
    String userId,
  );

  Future<Either<Failure, List<bool>>> fetchRestaurantLiked(
    List<String> restaurantIdList,
    String userId,
  );

  Future<Either<Failure, LikeEntity?>> fetchRestaurantLikedById(
    String restaurantId,
    String userId,
  );
}
