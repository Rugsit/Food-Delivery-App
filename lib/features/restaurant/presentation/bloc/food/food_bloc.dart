import 'package:ecommerce_project/features/restaurant/domain/entities/food.dart';
import 'package:ecommerce_project/features/restaurant/domain/usecase/fetch_food_by_restaurant_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'food_event.dart';
part 'food_state.dart';

@injectable
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc(this.fetchFood) : super(const FoodInitial()) {
    on<FetchFood>(_onFetchRestaurant);
  }

  final FetchFoodByRestaurantIdUseCase fetchFood;

  Future<void> _onFetchRestaurant(
    FetchFood event,
    Emitter<FoodState> emit,
  ) async {
    emit(const FoodLoading());

    final response = await fetchFood.call(event.restaurantId);

    response.fold(
      (left) => emit(FoodFailure(left.toString())),
      (right) => emit(FoodSuccess(foods: right)),
    );
  }
}
