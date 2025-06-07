part of 'order_bloc.dart';

class FetchOrderState extends Equatable {
  const FetchOrderState();

  @override
  List<Object> get props => [];
}

final class FetchOrderSuccess extends FetchOrderState {
  const FetchOrderSuccess({required this.orders});

  final List<OrderEntity> orders;

  @override
  List<Object> get props => [orders];
}

final class FetchOrderLoading extends FetchOrderState {
  const FetchOrderLoading();

  @override
  List<Object> get props => [];
}

final class FetchOrderFailure extends FetchOrderState {
  const FetchOrderFailure({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

final class FetchOrderInitial extends FetchOrderState {
  const FetchOrderInitial();

  @override
  List<Object> get props => [];
}
