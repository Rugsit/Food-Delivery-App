import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderLocalBloc extends Bloc<OrderLocalEvent, OrderLocalState> {
  OrderLocalBloc() : super(OrderLocalState(totalPrice: 0, totalProduct: 0)) {
    on<UpdateLocalOrder>(_updateLocalOrder);
  }

  void _updateLocalOrder(
    UpdateLocalOrder event,
    Emitter<OrderLocalState> emit,
  ) async {
    emit(
      OrderLocalState(
        totalPrice: state.totalPrice + event.productPrice,
        totalProduct: state.totalProduct + event.productQuantity,
      ),
    );
  }
}
