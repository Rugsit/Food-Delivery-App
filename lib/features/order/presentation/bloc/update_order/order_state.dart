part of 'order_bloc.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class TriggerUpdateOrderState extends OrderState {
  const TriggerUpdateOrderState();

  @override
  List<Object> get props => [];
}

final class UpdateOrderInitial extends OrderState {
  const UpdateOrderInitial();

  @override
  List<Object> get props => [];
}

final class UpdateOrderLoading extends OrderState {
  const UpdateOrderLoading();

  @override
  List<Object> get props => [];
}

final class UpdateOrderFailure extends OrderState {
  const UpdateOrderFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [];
}

final class UpdateOrderSuccess extends OrderState {
  const UpdateOrderSuccess();

  @override
  List<Object> get props => [];
}
