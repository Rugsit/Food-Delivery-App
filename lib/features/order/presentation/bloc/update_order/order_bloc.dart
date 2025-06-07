import 'package:ecommerce_project/features/order/domain/entities/order.dart';
import 'package:ecommerce_project/features/order/domain/usecase/fetch_order.dart';
import 'package:ecommerce_project/features/order/domain/usecase/update_order.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class UpdateOrderBloc extends Bloc<OrderEvent, OrderState> {
  UpdateOrderBloc({
    required this.updateOrderUseCase,
    required this.fetchOrderUseCase,
  }) : super(UpdateOrderInitial()) {
    on<TriggerUpdateOrderEvent>(_triggerUpdateOrder);
    on<UpdateOrderEvent>(_onUpdateOrder);
  }

  final UpdateOrderUseCase updateOrderUseCase;
  final FetchOrderUesCase fetchOrderUseCase;

  void _triggerUpdateOrder(
    TriggerUpdateOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(TriggerUpdateOrderState());
  }

  Future<void> _onUpdateOrder(
    UpdateOrderEvent event,
    Emitter<OrderState> emit,
  ) async {
    emit(UpdateOrderLoading());

    final response = await updateOrderUseCase.call(
      orderEntity: event.orderEntity,
    );

    response.fold(
      (left) => emit(UpdateOrderFailure(errorMessage: left.toString())),
      (right) => emit(UpdateOrderSuccess()),
    );
  }
}
