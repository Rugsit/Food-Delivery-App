import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/home/domain/repositories/restaurant_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: RestaurantRepository)
class RestaurantRepositoryImpl implements RestaurantRepository {
  final HomeRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RestaurantEntity>>> fetchRestaurant() async {
    try {
      final reponse = await remoteDataSource.fetchRestaurant();
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.map((item) => item.toEntityRestaurant()).toList()),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
