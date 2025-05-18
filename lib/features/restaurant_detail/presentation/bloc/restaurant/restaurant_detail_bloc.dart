import 'package:ecommerce_project/features/restaurant_detail/domain/entities/restaurant.dart';
import 'package:ecommerce_project/features/restaurant_detail/domain/usecases/fetch_restaurant_by_id.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

@injectable
class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  RestaurantDetailBloc(this.fetchRestaurants)
    : super(const RestaurantDetailInitial()) {
    on<FetchRestaurant>(_onFetchRestaurant);
  }

  final FetchRestaurantByIdUseCase fetchRestaurants;

  Future<void> _onFetchRestaurant(
    FetchRestaurant event,
    Emitter<RestaurantDetailState> emit,
  ) async {
    emit(const RestaurantDetailLoading());

    final response = await fetchRestaurants.call(event.id);

    response.fold(
      (left) => emit(RestaurantDetailFailure(left.toString())),
      (right) => emit(RestaurantDetailSuccess(restaurant: right)),
    );
  }
}
