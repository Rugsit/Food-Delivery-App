part of 'order_bloc.dart';

class OrderLocalState extends Equatable {
  const OrderLocalState({required this.totalPrice, required this.totalProduct});

  final int totalPrice;
  final int totalProduct;
  @override
  List<Object> get props => [totalPrice, totalProduct];
}
