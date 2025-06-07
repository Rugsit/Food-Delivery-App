import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:fpdart/fpdart.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> fetchOrder(String userId);
  Future<Either<Failure, OrderEntity>> addOrder(OrderEntity order);
  Future<Either<Failure, OrderEntity>> updateOrder({
    required OrderEntity orderEntity,
  });
  Future<Either<Failure, OrderEntity>> deleteOrder({
    required String userId,
    required String foodId,
  });
}
