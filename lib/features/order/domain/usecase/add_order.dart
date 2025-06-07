import 'package:ecommerce_project/core/error/failures.dart';
import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddOrderUseCase {
  AddOrderUseCase(this.orderRepository);
  OrderRepository orderRepository;

  Future<Either<Failure, OrderEntity>> call(OrderEntity order) async {
    try {
      final reponse = await orderRepository.addOrder(order);
      return reponse.fold(
        (left) => Either.left(left),
        (right) => Either.right(right),
      );
    } catch (e) {
      return Either.left(FetchFailure(errorMessage: e.toString()));
    }
  }
}
