import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/restaurant/data/datasource/restaurant_remote_datasource.dart';
import 'package:ecommerce_project/features/restaurant/data/models/food.dart';
import 'package:ecommerce_project/features/restaurant/data/models/like.dart';
import 'package:ecommerce_project/features/restaurant/data/models/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/like.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurant() async {
    try {
      final reponse = await remoteDataSource.fetchRestaurant();
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(
          right.map((item) => item.toRestaurantEntity()).toList(),
        ),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RestaurantEntity>> fetchRestaurantById(
    String id,
  ) async {
    try {
      final Either<Failure, RestaurantModel> reponse = await remoteDataSource
          .fetchRestaurantById(id);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.toRestaurantEntity()),
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
            userId: right.userId,
            restaurantId: right.restaurantId,
          ).toEntity(),
        ),
      );
    } catch (e) {
      return Either.left(InsertFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LikeEntity>> unlike(
    String restaurantId,
    String userId,
  ) async {
    try {
      final Either<Failure, LikeModel> response = await remoteDataSource.unlike(
        restaurantId,
        userId,
      );
      return response.fold(
        (left) => Either.left(left),
        (right) => Either.right(
          LikeModel(
            userId: right.userId,
            restaurantId: right.restaurantId,
          ).toEntity(),
        ),
      );
    } catch (e) {
      return Either.left(DeleteFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<bool>>> fetchRestaurantLiked(
    List<String> restaurantIdList,
    String userId,
  ) async {
    try {
      final response = await remoteDataSource.fetchRestaurantLiked(
        restaurantIdList,
        userId,
      );
      return response.fold((left) => Either.left(left), (right) {
        return Either.right(right);
      });
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, LikeEntity?>> fetchRestaurantLikedById(
    String restaurantId,
    String userId,
  ) async {
    try {
      final Either<Failure, LikeModel?> response = await remoteDataSource
          .fetchRestaurantLikedById(restaurantId, userId);
      return response.fold((left) => Either.left(left), (right) {
        if (right == null) {
          return Either.right(null);
        }
        return Either.right(right.toEntity());
      });
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurantByType(
    String type,
  ) async {
    try {
      final reponse = await remoteDataSource.fetchRestaurantByType(type);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(
          right.map((item) => item.toRestaurantEntity()).toList(),
        ),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurantByLike(
    String userId,
  ) async {
    try {
      final reponse = await remoteDataSource.fetchRestaurantByLike(userId);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(
          right.map((item) => item.toRestaurantEntity()).toList(),
        ),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
