import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/data/datasource/order_remote_datasource.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/repositories/order_repository.dart';
import 'package:ecommerce_project/features/restaurant/domain/entities/food.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDatasource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrder(String userId) async {
    try {
      final response = await remoteDataSource.fetchOrder(userId);
      return response.fold(
        (left) => Either.left(left),
        (right) =>
            Either.right(right.map((element) => element.toEntity()).toList()),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity order) async {
    try {
      final response = await remoteDataSource.addOrder(order);
      return response.fold(
        (left) => Either.left(left),
        (right) => Either.right(order),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> updateOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      final response = await remoteDataSource.updateOrder(
        orderEntity: orderEntity,
      );
      return response.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.toEntity()),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> deleteOrder({required String userId,required String foodId}) async {
    try {
      final response = await remoteDataSource.deleteOrder(userId: userId, foodId: foodId);
      return response.fold(
        (left) => Either.left(left),
        (right) => Either.right(right.toEntity()),
      );
    } catch (e) {
      return Either.left(DeleteFailure(errorMessage: e.toString()));
    }
  }
}
