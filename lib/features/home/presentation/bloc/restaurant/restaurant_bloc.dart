import 'package:ecommerce_project/features/home/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/home/domain/usecases/fetch_restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

@injectable
class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc(this.fetchRestaurants) : super(const RestaurantInitial()) {
    on<FetchRestaurant>(_onFetchRestaurants);
  }

  final FetchRestaurantsUseCase fetchRestaurants;

  Future<void> _onFetchRestaurants(
    FetchRestaurant event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const RestaurantLoading());

    final response = await fetchRestaurants.call();

    response.fold(
      (left) => emit(RestaurantFailure(left.toString())),
      (right) => emit(RestaurantSuccess(restaurants: right)),
    );
  }
}
