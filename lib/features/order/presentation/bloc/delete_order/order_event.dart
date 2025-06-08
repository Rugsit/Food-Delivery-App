part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();
}

final class DeleteOrderEvent extends OrderEvent {
  const DeleteOrderEvent({required this.userId, required this.foodId});

  final String userId;
  final String foodId;

  @override
  List<Object> get props => [userId, foodId];
}
