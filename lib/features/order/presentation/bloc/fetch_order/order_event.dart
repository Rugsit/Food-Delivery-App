part of 'order_bloc.dart';

sealed class FetchOrderEvent extends Equatable {
  const FetchOrderEvent();
}

final class GetOrders extends FetchOrderEvent {
  const GetOrders(this.userId);

  final String userId;

  @override
  List<Object> get props => [userId];
}
