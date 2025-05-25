import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/fetch_food_by_restaurant_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'order_event.dart';
part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.fetchFood)
    : super(OrderState(totalPrice: 0, totalProduct: 0)) {
    on<UpdateTotalProduct>(_updateTotalProduct);
    on<UpdateTotalPrice>(_updateTotalPrice);
  }

  final FetchFoodByRestaurantIdUseCase fetchFood;

  void _updateTotalProduct(UpdateTotalProduct event, Emitter<OrderState> emit) {
    emit(state.copyWith(totalProduct: state.totalProduct + event.value));
  }

  void _updateTotalPrice(UpdateTotalPrice event, Emitter<OrderState> emit) {
    emit(state.copyWith(totalPrice: state.totalPrice + event.value));
  }
}
