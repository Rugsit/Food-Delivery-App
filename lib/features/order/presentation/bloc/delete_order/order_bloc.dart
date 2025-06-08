import 'package:ecommerce_project/features/order/domain/usecase/delete_order.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class DeleteOrderBloc extends Bloc<DeleteOrderEvent, DeleteOrderState> {
  DeleteOrderBloc({required this.deleteOrderUseCase})
    : super(DeleteOrderInitial()) {
    on<DeleteOrderEvent>(_onDeleteOrder);
  }

  final DeleteOrderUesCase deleteOrderUseCase;

  Future<void> _onDeleteOrder(
    DeleteOrderEvent event,
    Emitter<DeleteOrderState> emit,
  ) async {
    emit(DeleteOrderLoading());

    final response = await deleteOrderUseCase.call(
      foodId: event.foodId,
      userId: event.userId,
    );

    response.fold(
      (left) => emit(DeleteOrderFailure(errorMessage: left.toString())),
      (right) => emit(DeleteOrderSuccess()),
    );
  }
}
