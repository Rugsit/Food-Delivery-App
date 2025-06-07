import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateOrderUseCase {
  UpdateOrderUseCase(this.orderRepository);
  OrderRepository orderRepository;

  Future<Either<Failure, OrderEntity>> call({
    required OrderEntity orderEntity,
  }) async {
    try {
      final reponse = await orderRepository.updateOrder(
        orderEntity: orderEntity,
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
