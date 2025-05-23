import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant_detail/data/models/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/data/models/like.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/data/datasources/restaurant_detail_remote_datasource.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/repositories/restaurant_detail_repository.dart';
import 'package:ecommerce_project/core/model/restaurant.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RestaurantDetailRepository)
class RestaurantDetailRepositoryImpl implements RestaurantDetailRepository {
  final RestaurantDetailRemoteDatasource remoteDataSource;

  RestaurantDetailRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, RestaurantDetailEntity>> fetchRestaurantById(
    String id,
  ) async {
    try {
      final Either<Failure, RestaurantModel> reponse = await remoteDataSource
          .fetchRestaurantById(id);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.toEntityRestaurantDetail()),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FoodEntity>>> fetchFoodByRestaurantId(
    String restaurantId,
  ) async {
    try {
      final Either<Failure, List<FoodModel>> reponse = await remoteDataSource
          .fetchFoodByRestaurantId(restaurantId);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.map((item) => item.toEntity()).toList()),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LikeEntity>> like(
    String restaurantId,
    String userId,
  ) async {
    try {
      final Either<Failure, LikeModel> response = await remoteDataSource.like(
        restaurantId,
        userId,
      );
      return response.fold(
        (left) => Either.left(left),
        (right) => Either.right(
          LikeModel(
            id: right.id,
            userId: right.userId,
            restaurantId: right.restaurantId,
          ).toEntity(),
        ),
      );
    } catch (e) {
      return Either.left(InsertFailure(errorMessage: e.toString()));
    }
  }
}
