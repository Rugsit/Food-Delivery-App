part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
}

final class UpdateOrderEvent extends OrderEvent {
  const UpdateOrderEvent({required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  List<Object> get props => [orderEntity];
}

final class TriggerUpdateOrderEvent extends OrderEvent {
  const TriggerUpdateOrderEvent();

  @override
  List<Object> get props => [];
}
