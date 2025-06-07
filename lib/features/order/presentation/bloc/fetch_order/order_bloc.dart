import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/usecase/fetch_order.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class FetchOrderBloc extends Bloc<FetchOrderEvent, FetchOrderState> {
  FetchOrderBloc({required this.fetchOrderUseCase})
    : super(FetchOrderInitial()) {
    on<GetOrders>(_getOrder);
  }

  final FetchOrderUesCase fetchOrderUseCase;

  Future<void> _getOrder(GetOrders event, Emitter<FetchOrderState> emit) async {
    emit(FetchOrderLoading());

    final response = await fetchOrderUseCase.call(event.userId);

    response.fold(
      (left) => emit(FetchOrderFailure(errorMessage: left.toString())),
      (right) => emit(FetchOrderSuccess(orders: right)),
    );
  }
}
