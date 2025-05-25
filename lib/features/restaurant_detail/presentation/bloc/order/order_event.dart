part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
}

final class UpdateTotalProduct extends OrderEvent {
  const UpdateTotalProduct({required this.value});

  final int value;

  @override
  List<Object> get props => [value];
}

final class UpdateTotalPrice extends OrderEvent {
  const UpdateTotalPrice({required this.value});

  final double value;

  @override
  List<Object> get props => [value];
}
