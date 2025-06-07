part of 'order_bloc.dart';

class DeleteOrderState extends Equatable {
  const DeleteOrderState();

  @override
  List<Object> get props => [];
}

final class DeleteOrderInitial extends DeleteOrderState {
  const DeleteOrderInitial();

  @override
  List<Object> get props => [];
}

final class DeleteOrderLoading extends DeleteOrderState {
  const DeleteOrderLoading();

  @override
  List<Object> get props => [];
}

final class DeleteOrderFailure extends DeleteOrderState {
  const DeleteOrderFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [];
}

final class DeleteOrderSuccess extends DeleteOrderState {
  const DeleteOrderSuccess();

  @override
  List<Object> get props => [];
}
