import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteOrderUesCase {
  DeleteOrderUesCase(this.orderRepository);
  OrderRepository orderRepository;

  Future<Either<Failure, OrderEntity>> call({
    required String foodId,
    required String userId,
  }) async {
    try {
      final reponse = await orderRepository.deleteOrder(
        foodId: foodId,
        userId: userId,
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
