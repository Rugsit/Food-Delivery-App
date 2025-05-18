import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:fpdart/fpdart.dart';

abstract class RestaurantDetailRepository {
  Future<Either<Failure, RestaurantDetailEntity>> fetchRestaurantById(String id);
}
