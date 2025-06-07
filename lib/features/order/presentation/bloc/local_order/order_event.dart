part of 'order_bloc.dart';

sealed class OrderLocalEvent extends Equatable {
  const OrderLocalEvent();
}

final class UpdateLocalOrder extends OrderLocalEvent {
  const UpdateLocalOrder({
    required this.productPrice,
    required this.productQuantity,
  });

  final int productQuantity;
  final int productPrice;

  @override
  List<Object> get props => [productQuantity, productQuantity];
}
