import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:fpdart/fpdart.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurant();
  Future<Either<Failure, RestaurantEntity>> fetchRestaurantById(String id);
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

  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurantByType(
    String type,
  );

  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurantByLike(
    String userId,
  );
}
